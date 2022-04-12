package admin.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ADShlistDetailController {
	private final String command = "shlistdetail.ad";
	private String getPage = "adshlistdetail";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doAction() {
		
		return getPage;
	}
	
}
