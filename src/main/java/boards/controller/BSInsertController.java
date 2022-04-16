package boards.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;

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

import boards.model.BSBean;
import boards.model.BSDao;

@Controller
public class BSInsertController {
	private final String command = "insert.bs";
	private String getPage = "writeForm";
	private String gotoPage = "redirect:/list.bs";
	
	@Inject
	private BSDao bsdao;
	@Autowired
	ServletContext servletContext;

	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction() {
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView doAction(@Valid BSBean bsbean,BindingResult result,HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		
		//날짜
		Timestamp reg_date =  new Timestamp(System.currentTimeMillis());
		bsbean.setReg_date(reg_date);
		
		//ip주소
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
