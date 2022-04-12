package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberFindIdController {
	
	private final String command = "findid.mem";
	private String getPage = "memberFindIdForm";
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction() {
		
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String doAction1() {
		
		return getPage;
	}
}
