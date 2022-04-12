package user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class USHomeListController {
	
	private final String command = "home.us";
	private String getPage = "ushome";

	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doAction(HttpServletRequest request) {
		
		return getPage;
	}
}
