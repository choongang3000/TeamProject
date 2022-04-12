package student.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class STUShlistController {
	private final String command = "shlist.stu";
	private String getPage = "stushlist";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doAction() {
		
		return getPage;
	}

}
