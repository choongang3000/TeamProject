package admin.controller;

import java.io.File;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import admin.model.TeacherBean;
import admin.model.TeacherDao;


@Controller
public class ADTcUpdateController {

	private final String command = "tcupdate.ad";
	private String getPage = "tcupdateForm";
	private String gotoPage = "redirect:/tcdetail.ad";
	private String beforeFile;
	
	@Autowired
	private TeacherDao tdao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(@RequestParam(value="anum",required=true) int anum,
							HttpServletRequest request) {
		
		List<String> subArr = tdao.getSubject();
		TeacherBean tbean = tdao.getTeacherData(anum);
		
		beforeFile = tbean.getT_image();
		
		request.setAttribute("tbean", tbean);
		request.setAttribute("subArr", subArr);
		
		return getPage;
	}

	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView doAction(@ModelAttribute("tbean") TeacherBean tbean) {
		
		tbean.setAddr(tbean.getAddr_num()+"|"+tbean.getAddr_first()+"|"+tbean.getAddr_last());

		ModelAndView mav = new ModelAndView();
		
		String uploadPath = servletContext.getRealPath("/resources");

		if( !tbean.getT_image().equals("") ) {
			MultipartFile multi = tbean.getUpload();
		
			if(beforeFile != null) {
				File dir = new File(uploadPath,beforeFile);
				if(dir.exists()) {
					dir.delete();
				}
			}
			
			
			UUID uuid = UUID.randomUUID();
			String fileName = uuid + "-" + multi.getOriginalFilename();
			
			tbean.setT_image(fileName);
			
			int cnt1 = tdao.updateAccount(tbean);
			int cnt2 = tdao.updateTeacher(tbean);
			
			if(cnt1>0 && cnt2>0) {
				File f = new File(uploadPath,fileName);
				try {
					multi.transferTo(f);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
			mav.setViewName(gotoPage + "?anum=" + tbean.getAnum());
		}//
		
		else {
			tbean.setT_image(beforeFile);
			tdao.updateAccount(tbean);
			tdao.updateTeacher(tbean);
			mav.setViewName(gotoPage + "?anum=" + tbean.getAnum());
		}
		
		return mav;
	}
	
	
}
