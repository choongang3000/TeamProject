package teacher.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import teacher.model.TeacherBean;
import teacher.model.TeacherDao;

@Controller
public class TCInsertController {
	
	private final String command="insert.tc";
	private String getPage = "insertTcForm";
	private String gotoPage = "redirect:/list.tc";
	
	@Autowired
	private TeacherDao tdao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(HttpServletRequest request) {
		
		List<String> subArr = tdao.getSubject();
		
		request.setAttribute("subArr", subArr);
		
		System.out.println(subArr.size());
		
		return getPage;
	}

	@RequestMapping(value=command, method=RequestMethod.POST)
	public String doAction(TeacherBean tBean) {
		

		String uploadPath = servletContext.getRealPath("/resources");
		if(!tBean.getT_image().equals("")) {
			MultipartFile multi = tBean.getUpload();
			
			UUID uuid = UUID.randomUUID();
			String fileName = uuid + "-" + multi.getOriginalFilename();
			
			tBean.setT_image(fileName); 
		
		
			int cnt1 = tdao.insertAccount(tBean);
			int cnt2 = tdao.insertTeacher(tBean);
			
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
		}
		else {
			tdao.insertAccount(tBean);
			tdao.insertTeacher(tBean);
		}
		
		return gotoPage;
	}
	
}
