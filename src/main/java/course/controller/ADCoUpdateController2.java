package course.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import course.model.COSBean;
import course.model.CoBean2;
import course.model.CoDao2;
import course.model.SubBean2;
import course.model.SubDao2;
import utility.COSListPaging;

@Controller
public class ADCoUpdateController2 {
	private final String command = "coupdate.cos";
	private String getPage = "coupdateForm2";
	private String gotoPage = "redirect:/list.cos";
	
	@Inject
	@Qualifier("myCoDao2")
	private CoDao2 codao;
	
	@Inject
	private SubDao2 subdao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doAction(@RequestParam(value="conum", required=true) String conum,Model model) {
		List<SubBean2> sublist = subdao.subjectAll();
		CoBean2 cobean = codao.coursesCount(conum);
		model.addAttribute("cobean",cobean);
		model.addAttribute("sublist",sublist);
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView doAction(
			@RequestParam(value="whatColumn",required = false) String whatColumn,
			@RequestParam(value="pageNumber", required=true) String pageNumber,
			@Valid CoBean2 cobean, BindingResult result) {
		
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
		
		//여기서부터..
		/*
		Map<String, String> map=new HashMap<String, String>();
		int totalCount=codao.totalCount(map);
		
		String url ;
		if(cosubject != null) {
			url = request.getContextPath()+command+"?cosubject="+cosubject;
		}
		else {
			url = request.getContextPath()+command;
		}
		COSListPaging pageInfo=new COSListPaging(pageNumber, null, totalCount, url, whatColumn, keyword);
		List<COSBean> list = cosdao.getCOSList(pageInfo, map);
		
		*/
		
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
			
			 /*mav.addObject("pageInfo",pageInfo);*/
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
