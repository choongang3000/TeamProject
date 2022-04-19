package student.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import student.model.STUOrderBean;
import student.model.STUOrderBindBean;
import student.model.STUOrderDao;
import student.model.STUOrderDeBean;
import student.model.STUOrderDeDao;

@Controller
public class STUShlistController {
	private final String command = "shlist.stu";
	private String getPage = "stushlist";
	
	@Autowired
	private STUOrderDao odao;
	
	@Autowired
	private STUOrderDeDao oddao;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doAction(HttpSession session,
							HttpServletRequest request) {
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		
		List<STUOrderBindBean> obArr = new ArrayList<STUOrderBindBean>(); 
		
		List<STUOrderBean> obeanArr = odao.orderList(loginInfo.getId());
		
		for(STUOrderBean obean : obeanArr) {
			STUOrderBindBean obbean = new STUOrderBindBean();
			
			int onum = obean.getOnum();
			
			List<STUOrderDeBean> odbeanArr = oddao.getOrderDetailList(onum);
			
			obbean.setObean(obean);
			obbean.setConame(odbeanArr.get(0).getConame());
			obbean.setElseNum(odbeanArr.size()-1);
			
			obArr.add(obbean);
		}
		
		request.setAttribute("obArr", obArr);	
		
		return getPage;
	}

}
