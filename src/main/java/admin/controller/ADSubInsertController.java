package admin.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import admin.model.SubBean;
import admin.model.SubDao;

@Controller
public class ADSubInsertController {
	private final String command = "subinsert.ad";
	private String getPage = "redirect:/sublist.ad";
	
	@Inject
	private SubDao subdao;
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String doAction(SubBean subbean,HttpServletRequest request) {
		subdao.insertSubject(subbean);
		
		return getPage;
	}
}
