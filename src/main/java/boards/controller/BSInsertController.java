package boards.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
import admin.model.TeacherBean;
import admin.model.TeacherDao;
import boards.model.BSBean;
import boards.model.BSDao;
import member.model.MemberBean;

@Controller
public class BSInsertController {
	private final String command = "insert.bs";
	private String getPage = "writeForm";
	private String gotoPage = "redirect:/list.bs";
	
	@Inject
	private BSDao bsdao;
	/*
	@Inject
	private CoDao codao;
	
	@Inject
	private TeacherDao tdao;
	*/
	@Autowired
	ServletContext servletContext;

	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(HttpServletRequest request, HttpSession session) {
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		
		List<Integer> oddConumArr = bsdao.getOddConums(loginInfo.getId());
		
		ArrayList<String> conameArr = new ArrayList<String>();
		ArrayList<String> teacherArr = new ArrayList<String>();
		for(Integer conum : oddConumArr) {
			conameArr.add(bsdao.getConame(conum));
			teacherArr.add(bsdao.getCoteacher(conum));
		}
		
		request.setAttribute("conameArr", conameArr);
		request.setAttribute("teacherArr", teacherArr);
		
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView doAction(@Valid BSBean bsbean,BindingResult result,HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		/* mav.addObject(loginInfo,"loginInfo"); */
		
		//날짜
		Timestamp reg_date =  new Timestamp(System.currentTimeMillis());
		bsbean.setReg_date(reg_date);
		
		//ip주소 => 사용안함
		//String ip = request.getRemoteAddr();
		//bsbean.setIp(ip);
		/* bsbean.setIp(request.getRemoteAddr()); */
		
		//이미지 경로
		String uploadPath = servletContext.getRealPath("/resources");
		//System.out.println("RealPath(/):"+servletContext.getRealPath("/"));
		//System.out.println("RealPath(/resources):"+servletContext.getRealPath("/resources"));
		//System.out.println(uploadPath+"\\" + bsbean.getImage());
		
		MultipartFile multi = bsbean.getUpload();
		 
		if(result.hasErrors()) {
			//System.out.println(bsbean.getWriter());
			//System.out.println(bsbean.getSubject());
			//System.out.println(bsbean.getPasswd());
			//System.out.println(bsbean.getContent());
			//System.out.println(bsbean.getIp());
			
			mav.setViewName(getPage); //writeForm.jsp
			return mav;
		}
		
		 int cnt = bsdao.insertBS(bsbean); 
		 System.out.println("cnt:"+cnt);
		 if(cnt > 0) {
			 File f = new File(uploadPath+"\\" + bsbean.getImage());
			 
			 try {
				multi.transferTo(f);
			} catch (IllegalStateException e) {
				System.out.println("BS삽입 이미지파일 오류1");
			} catch (IOException e) {
				System.out.println("BS삽입 이미지파일 오류2");
			}
			 mav.setViewName(gotoPage); //redirect:/list.bs
		 }
		 
		 else {
			 mav.setViewName(getPage); //writeForm.jsp
		 }
		
		 return mav; 
	}
	
}
