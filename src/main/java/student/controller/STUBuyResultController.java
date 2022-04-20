package student.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import member.model.MemberBean;
import student.model.STUOrderDao;
import student.model.STUOrderDeBean;
import student.model.STUOrderDeDao;

@Controller
public class STUBuyResultController {

	private final String command = "buyresult.stu";
	private String getPage = "stuOrderResult";
	
	@Autowired 
	private STUOrderDao orderdao;
	 
	@Autowired
	private STUOrderDeDao oddao;
	
	@RequestMapping(command)
	public String doAction(HttpSession session,HttpServletRequest request) {
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		
		int maxOnum = orderdao.getMaxOnum(loginInfo.getId());
		
		List<STUOrderDeBean> odbeanArr = oddao.getOrderDetailList(maxOnum);
	    
	    request.setAttribute("odbeanArr", odbeanArr);
	    
		return getPage;
	}
	
}
