package course.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import course.model.COSBean;
import course.model.COSDao;

@Controller
public class COSInsertController {

	private final String command = "insert.cos";
	private String getPage = "cosInsertForm";
	private String gotoPage="redirect:/list.cos";

	
	@Autowired
	private COSDao cosdao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doAction(HttpSession session) {
		
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

