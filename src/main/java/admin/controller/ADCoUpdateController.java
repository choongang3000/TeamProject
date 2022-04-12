package admin.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import admin.model.CoBean;
import admin.model.CoDao;
import admin.model.SubBean;
import admin.model.SubDao;

@Controller
public class ADCoUpdateController {
	private final String command = "coupdate.ad";
	private String getPage = "coupdateForm";
	private String gotoPage = "redirect:/colist.ad";
	
	@Inject
	private CoDao codao;
	
	@Inject
	private SubDao subdao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doAction(@RequestParam(value="conum", required=true) String conum,Model model) {
		List<SubBean> sublist = subdao.subjectAll();
		CoBean cobean = codao.coursesCount(conum);
		model.addAttribute("cobean",cobean);
		model.addAttribute("sublist",sublist);
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView doAction(@Valid CoBean cobean, BindingResult result) {
		
		ModelAndView mav = new ModelAndView();
		
		System.out.println("update 넘어옴");
		
		//이미지, 영상
		String uploadPath = servletContext.getRealPath("/resources");
		
		//유효성검사 에러
		if(result.hasErrors()) {
			System.out.println("유효성검사");
			mav.setViewName(getPage);
			return mav;
		}

		MultipartFile upimage = cobean.getUpimage();
		MultipartFile upvideo = cobean.getUpvideo();
		
		UUID uuid = UUID.randomUUID();
		String imageName = uuid + "-" + upimage.getOriginalFilename();
		String videoName = uuid + "-" + upvideo.getOriginalFilename();
		
		cobean.setCoimage(imageName);
		cobean.setCovideo(videoName);
		
		int cnt = codao.updateCourses(cobean);
		
		//업데이트 성공
		if(cnt > 0) { 
			 File imagef = new File(uploadPath,imageName);
			 File videof = new File(uploadPath,videoName);
			 System.out.println("cnt>0");
			 
			 try {
				 upimage.transferTo(imagef);
				 upvideo.transferTo(videof);
				 
			} catch (IllegalStateException e) {
				System.out.println("Courses 삽입 오류1");
			} catch (IOException e) {
				System.out.println("Courses 삽입 오류2");
			}
			 System.out.println("강의 update 성공");
			 mav.setViewName(gotoPage); //redirect:/colist.ad
			 return mav;
			 
		}//cnt>0

		//업데이트 실패
		else {
			codao.updateCourses(cobean);
			mav.setViewName(getPage+"?conum="+cobean.getConum()); //coupdateForm
			System.out.println("강의 update 실패");
		}//업데이트 실패
		
		return mav;
	}
	
}