package student.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class STUShlistDetailController {
	private final String command = "shlistdetail.stu";
	private String getPage = "stushlistdetail";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	   public String doAction(HttpSession session) {
	      
	      session.removeAttribute("mycart");
	      session.removeAttribute("cartArr");
	      
	      return getPage;
	   }
	
}
