package admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ADListController {
	private final String command = "list.ad";
	private String getPage = "adhome";
	
	@RequestMapping(value=command)
	public String doAction() {
		return getPage;
	}
}
