package student.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import student.model.STUOrderBean;
import student.model.STUOrderDao;
import student.model.STUOrderDeBean;
import student.model.STUOrderDeDao;
import student.model.StuCartBean;

@Controller
public class STUBuyController {
	
	private final String command = "buycos.stu";
	private String gotoPage = "redirect:/buyresult.stu";
	//private String gotoPage = "stushlistdetail";
	
	@Autowired 
	private STUOrderDao orderdao;
	 
	@Autowired 
	private STUOrderDeDao oddao;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doAction(@RequestParam(value="totalprice", required=true) int totalprice,
							StuCartBean cartbean, HttpServletRequest request, HttpSession session) {
		
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		
		STUOrderBean obean = new STUOrderBean();
		obean.setAid(loginInfo.getId());
		obean.setTotprice(totalprice);
		
		int cnt = orderdao.insertOrder(obean);
		
		int maxOnum = orderdao.getMaxOnum(loginInfo.getId());
		
		ArrayList<Integer> mycart = (ArrayList<Integer>)session.getAttribute("mycart");
		
		for(int conum : mycart) {
			STUOrderDeBean odbean = new STUOrderDeBean();
			odbean.setAid(loginInfo.getId());
			odbean.setOnum(maxOnum);
			odbean.setConum(conum);
			
			oddao.insertOrderDetail(odbean);
		}
		
		session.removeAttribute("mycart");
		session.removeAttribute("cartArr");
		
		return gotoPage;
		
		/* 
		ArrayList<StuCartBean> cartArr =  (ArrayList<StuCartBean>)session.getAttribute("cartArr");
		
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		  
		orderdao.insertOrder(loginInfo.getId());
		 
		int maxOnum = orderdao.getMaxOnum();
		System.out.println("maxOnum:"+maxOnum);
		
		STUOrderDeBean odbean = new STUOrderDeBean();
		odbean.setOnum(maxOnum);
		oddao.insertOrderDetail(odbean);
		
		request.setAttribute("cartArr", cartArr);
		*/
	}
	
}


/*

	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doAction(HttpServletRequest request,HttpSession session) {
		
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
		request.setAttribute("cartArr",	cartArr);
		
		return getPage;
	}
	
*/