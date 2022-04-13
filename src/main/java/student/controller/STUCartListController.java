package student.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import admin.model.CoBean;
import student.model.StuCartBean;
import student.model.StuCartDao;

@Controller
public class STUCartListController {
	
	private final String command = "cartlist.stu";
	private String getPage = "stuCartList";
	
	@Autowired
	private StuCartDao scdao;
	
	@RequestMapping(command)
	public String doAction(HttpSession session, HttpServletRequest request) {
		
		ArrayList<Integer> mycart = (ArrayList<Integer>)session.getAttribute("mycart");
		
		ArrayList<StuCartBean> cartArr = new ArrayList<StuCartBean>();
		
		int totalprice = 0;
		for(int conum: mycart) {
			
			CoBean cobean = scdao.getCourseByConum(conum);
			
			StuCartBean cart = new StuCartBean(conum, cobean.getConame(), cobean.getCoteacher(), cobean.getCosubject(), cobean.getCoimage() , cobean.getCoprice()); 
			
			totalprice += cobean.getCoprice();
			
			cartArr.add(cart);
		}
		
		request.setAttribute("totalprice", totalprice);
		request.setAttribute("cartArr", cartArr);
		session.setAttribute("cartArr", cartArr);
		
		return getPage;
	}
}
