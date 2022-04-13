package teacher.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TCShlistController {

	private final String command = "shlist.tc";
	private String getPage = "tcshlist";
	
	@RequestMapping(value=command)
	public String doAction() { 
		return getPage;
	}
}
