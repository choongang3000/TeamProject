package course.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import admin.model.SubBean;
import admin.model.TeacherBean;
import admin.model.TeacherDao;
import course.model.COSBean;
import course.model.COSDao;

@Controller
public class COSInsertController {

	private final String command = "insert.cos";
	private String getPage = "cosInsertForm";
	private String gotoPage="redirect:/list.cos";
	//@Inject
	//private TeacherDao tdao;
	
	@Autowired
	private COSDao cosdao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doAction(HttpSession session,HttpServletRequest request) {
		/*
		//선생님 정보 가져오기
		List<TeacherBean> telist = new ArrayList<TeacherBean>();
		telist = tdao.selectTeacher();
		request.setAttribute("telist", telist);
		*/
		System.out.println("loginInfo:"+session.getAttribute("loginInfo"));
		
		if(session.getAttribute("loginInfo") == null) {
			session.setAttribute("destination", "redirect:/insert.cos");
			return "redirect:/loginForm.ac";
		}
		else {
			return getPage;
		}
	}
	
	// 
	@RequestMapping(value=command, method=RequestMethod.POST) 
	 public ModelAndView doAction(@Valid COSBean bean, BindingResult result) {
	 
		 ModelAndView mav = new ModelAndView();
		 if(result.hasErrors()) {
			 mav.setViewName(getPage);
			 return mav;
		 }
		 
		 System.out.println("RealPath(/):"+servletContext.getRealPath("/"));
		 System.out.println("RealPath(/resources):"+servletContext.getRealPath("/resources"));
		 
		 String uploadPath = servletContext.getRealPath("/resources");
		 System.out.println(uploadPath+"\\" + bean.getCoimage());
		 
		 MultipartFile multi = bean.getUpload();
		 
		 int cnt = cosdao.insertCOS(bean); 
		 if(cnt > 0) {
			 File f = new File(uploadPath+"\\" + bean.getCoimage());
			 
			 try {
				multi.transferTo(f);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			 mav.setViewName(gotoPage);
		 }
		 else {
			 mav.setViewName(getPage);
		 }
		
		 return mav; 
	 }
	
}

