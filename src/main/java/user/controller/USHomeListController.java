package user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;

@Controller
public class USHomeListController {
	
	private final String command = "home.us";
	private String getPage = "ushome";

	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doAction(HttpServletRequest request, HttpSession session) {
		
		session.getAttribute("loginInfo");
		
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		
		request.setAttribute("loginInfo", loginInfo);
		
		return getPage;
	}
}
