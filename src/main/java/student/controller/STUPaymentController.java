package student.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import student.model.StuCartBean;

@Controller
public class STUPaymentController {
	private final String command = "payment.stu";
	private String getPage = "stupaymentForm";
	private String gotoPage = "buycos.stu";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doAction1(HttpSession session,
							HttpServletRequest request) {
		
		ArrayList<StuCartBean> cartArr =  (ArrayList<StuCartBean>)session.getAttribute("cartArr");
		
		request.setAttribute("cartArr", cartArr);
		
		int totalprice = 0;
		int totalcount = 0;
		for(StuCartBean cart : cartArr) {
			totalcount += 1;
			totalprice += cart.getCoprice();
		}
		
		request.setAttribute("totalcount",totalcount);
		request.setAttribute("totalprice",totalprice);
		
		return getPage;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String doAction2(HttpSession session,HttpServletRequest request) {
		ArrayList<StuCartBean> cartArr =  (ArrayList<StuCartBean>)session.getAttribute("cartArr");
		request.setAttribute("cartArr", cartArr);
		
		return gotoPage;
	}

}
