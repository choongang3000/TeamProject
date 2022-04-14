package student.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import admin.model.TeacherBean;
import student.model.STDao;

@Controller
public class STUListController {

	private final String command = "list.stu";
	private String getPage = "stuhome";
	
	@RequestMapping(value=command)
	public String doAction(HttpSession session) {
		
		return getPage;
	}
}
