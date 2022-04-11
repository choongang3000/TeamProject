package teacher.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TCListController {
	private final String command = "list.tc";
	private String getPage = "tchome";
	
	@RequestMapping(value=command)
	public String doAction() {
		return getPage;
	}
}
