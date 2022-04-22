package student.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.CoBean;
import member.model.MemberBean;
import student.model.STUOrderDeDao;
import student.model.StuCartBean;
import student.model.StuCartDao;

@Controller
public class STUBuyDirectController {

	private final String command = "buydirect.stu";
	private String gotoPage = "redirect:/payment.stu";
	
	@Autowired
	private STUOrderDeDao stuoddDao;
	
	@Autowired
	private StuCartDao scdao;
	
	@RequestMapping(command)
	public String doAction(@RequestParam(value="conum", required=false ) int conum,
							HttpServletResponse response,
							HttpServletRequest request,
							HttpSession session) {
		
		response.setContentType("text/html;charset=UTF-8");
		
		String urlpath = null;
		
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		if(loginInfo == null) {
			
			session.setAttribute("destination", "redirect:/detail.cos?conum=" + conum);
			
			return "redirect:/loginForm.mem";
		}
		else {
		
			List<Integer> orderArr = stuoddDao.getOrderDetailConums(loginInfo.getId());
			if(orderArr.contains(conum)) {
				try {
					
					String referer = request.getHeader("Referer");
					String[] urlArr = referer.split(request.getContextPath());
					
					urlpath = urlArr[1];
					
					PrintWriter out = response.getWriter();
					out.print("<script>alert('이미 구매한 강의입니다'); history.back(-1);</script>");
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
			}
			else {
				
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
		return "redirect:" + urlpath ;
	}
}
