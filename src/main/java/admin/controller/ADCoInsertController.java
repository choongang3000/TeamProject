package admin.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import admin.model.CoBean;
import admin.model.CoDao;
import admin.model.SubBean;
import admin.model.SubDao;

@Controller
public class ADCoInsertController {
	private final String command = "coinsert.ad";
	private String getPage = "coinsertForm";
	private String gotoPage = "redirect:/colist.ad";
	@Inject
	private SubDao subdao;
	@Inject
	private CoDao codao;
	@Autowired
	ServletContext servletContext;
	
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(HttpServletRequest request) {
		List<SubBean> sublist = subdao.subjectAll();
		request.setAttribute("sublist", sublist);
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView doAction(CoBean cobean,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		//날짜
		Timestamp date =  new Timestamp(System.currentTimeMillis());
		cobean.setCoupload_date(date);
		
		//이미지, 영상
		String uploadPath = servletContext.getRealPath("/resources");
		MultipartFile upimage = cobean.getUpimage();
		MultipartFile upvideo = cobean.getUpvideo();
		
		int cnt = codao.insertCourses(cobean);
		if(cnt > 0) {
			 File imagef = new File(uploadPath+"\\" + cobean.getCoimage());
			 File videof = new File(uploadPath+"\\" + cobean.getCovideo());
			 
			 try {
				 upimage.transferTo(imagef);
				 upvideo.transferTo(videof);
			} catch (IllegalStateException e) {
				System.out.println("Courses 삽입 오류1");
			} catch (IOException e) {
				System.out.println("Courses 삽입 오류2");
			}
			 mav.setViewName(gotoPage);
		 }
		 
		 else {
			 mav.setViewName(getPage);
		 }
		
		return mav;
	}
	
}
