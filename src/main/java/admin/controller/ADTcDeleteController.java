package admin.controller;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.TeacherBean;
import admin.model.TeacherDao;
	
@Controller
public class ADTcDeleteController {
	
	private final String command = "tcdelete.ad";
	private String gotoPage = "redirect:/tclist.ad";
	
	@Autowired
	private TeacherDao tdao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command)
	public String doAction(@RequestParam(value="anum", required=true) int anum) {
		
		String uploadPath = servletContext.getRealPath("/resources/images");
		
		TeacherBean tbean = tdao.getTeacherData(anum);
		 
		if(tbean.getT_image() != null) {//!tbean.getT_image().equals("")
			File dir = new File(uploadPath,tbean.getT_image());
			
			if(dir.exists()) {
				dir.delete();
			}
		}

		tdao.deleteAccount(tbean.getAnum());
		tdao.deleteTeacher(tbean.getTnum());
		
		return gotoPage;
	}
}
