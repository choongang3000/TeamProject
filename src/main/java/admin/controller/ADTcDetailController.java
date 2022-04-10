package admin.controller;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.TeacherBean;
import admin.model.TeacherDao;


@Controller
public class ADTcDetailController {
	
	private final String command = "tcdetail.ad";
	private String getPage = "tcdetailForm";
	
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
