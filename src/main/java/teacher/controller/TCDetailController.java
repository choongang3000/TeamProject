package teacher.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import teacher.model.TeacherBean;
import teacher.model.TeacherDao;

@Controller
public class TCDetailController {
	
	private final String command = "detail.tc";
	private String getPage = "detailTeacherForm";
	
	@Autowired
	private TeacherDao tdao;
	
	@RequestMapping(value=command)
	public String doAction(@RequestParam(value="anum", required=true) int anum,
							HttpServletRequest request) {
		
		TeacherBean tbean = tdao.getTeacherData(anum);
		
		request.setAttribute("tbean", tbean);
		
		return getPage;
	}
	
}
