package student.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class STUListController {

	private final String command = "list.stu";
	private String getPage = "stuhome";
	
	@RequestMapping(value=command)
	public String doAction() {
		return getPage;
	}
}
