package login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LOGINController {
	private final String command = "login.log";
	private String getPage = "login";
	
	
	@RequestMapping(value=command)
	public String doAction() {

		return getPage;
	}
}
