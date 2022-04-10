package student.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class STUPaymentController {
	private final String command = "payment.stu";
	private String getPage = "stupaymentForm";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doAction() {
		
		return getPage;
	}

}
