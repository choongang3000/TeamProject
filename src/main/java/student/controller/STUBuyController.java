package student.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import student.model.StuCartBean;

@Controller
public class STUBuyController {
	
	private final String command = "buycos.stu";
	private String getPage = "stushlist";
	
	@RequestMapping(command)
	public String doAction(HttpServletRequest request,
							HttpSession session) {
		
		ArrayList<StuCartBean> cartArr =  (ArrayList<StuCartBean>)session.getAttribute("cartArr");
		
		int totalprice = 0;
		for(StuCartBean cart : cartArr) {
			totalprice += cart.getCoprice();
		}
		
		return getPage;
	}
}
