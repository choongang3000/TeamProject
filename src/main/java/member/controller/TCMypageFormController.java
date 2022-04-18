package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TCMypageFormController {
	
	private final String command = "mypage.mem";
	private String getPage = "tcmypage";
	
	@RequestMapping(command)
	public String doAction() {
		
		return getPage;
	}

}
