package student.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import student.model.STUOrderDeBean;
import student.model.STUOrderDeDao;

@Controller
public class STUShlistDetailController {
	private final String command = "shlistdetail.stu";
	private String getPage = "stushlistdetail";
	
	@Autowired
	private STUOrderDeDao oddao;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doAction(HttpSession session,
			   				HttpServletRequest request,
			   				@RequestParam(value="onum", required=true) int onum) {
	    
		List<STUOrderDeBean> odArr = oddao.getOrderDetailList(onum);
		
		request.setAttribute("odArr", odArr);
			
		return getPage;
	}
	
}
