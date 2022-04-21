package student.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.CoBean;
import member.model.MemberBean;
import student.model.StuCartBean;
import student.model.StuCartDao;

@Controller
public class STUBuyDirectController {

	private final String command = "buydirect.stu";
	private String gotoPage = "redirect:/payment.stu";
	
	@Autowired
	private StuCartDao scdao;
	
	@RequestMapping(command)
	public String doAction(@RequestParam(value="conum", required=false ) int conum,
							HttpSession session) {
		
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		if(loginInfo == null) {
			session.setAttribute("destination", "redirect:/buydirect.stu?conum=" + conum);
			return "redirect:/loginForm.mem";
		}
		
		session.removeAttribute("mycart");
		
		ArrayList<Integer> mycart = new ArrayList<Integer>();
		
		mycart.add(conum); 	
		
		session.removeAttribute("cartArr");		
		
		ArrayList<StuCartBean> cartArr = new ArrayList<StuCartBean>();
		
		CoBean cobean = scdao.getCourseByConum(conum);
		
		StuCartBean cartbean = new StuCartBean();
		cartbean.setConame(cobean.getConame());
		cartbean.setConum(cobean.getConum());
		cartbean.setCoimage(cobean.getCoimage());
		cartbean.setCoprice(cobean.getCoprice());
		cartbean.setCosubject(cobean.getCosubject());
		cartbean.setCoteacher(cobean.getCoteacher());
		
		cartArr.add(cartbean);
		
		session.setAttribute("cartArr", cartArr);
		session.setAttribute("mycart", mycart);
		
		return gotoPage;
	}
}
