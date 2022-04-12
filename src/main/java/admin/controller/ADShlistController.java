package admin.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ADShlistController {
	
	private final String command = "shlist.ad";
	private String getPage = "adshlist";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doAction() {
		
		return getPage;
	}
}
