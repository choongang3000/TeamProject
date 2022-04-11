package user.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class USSubListController {

	//admin.model에 있는 SubBean 사용
	
	private final String command = "submenu.us";
	private String getPage = "ussubmenu";

	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doAction(HttpServletRequest request) {
		
		return getPage;
	}
}
