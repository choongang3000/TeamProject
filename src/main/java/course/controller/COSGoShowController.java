package course.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import course.model.COSDao;
import member.model.MemberBean;

@Controller
public class COSGoShowController {
	
	private final String command = "goshow.cos";
	private String gotoPage = "redirect:/show.cos";
	
	@Autowired
	private COSDao codao;
	
	@RequestMapping(command)
	public String doAction(@RequestParam(value="conum", required=true) int conum,
							HttpSession session,
							HttpServletResponse response) {
		
		response.setContentType("text/html;charset=UTF-8");
		
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		
		if(loginInfo == null) {
			session.setAttribute("destination", "redirect:/goshow.cos?conum="+conum);
			return "redirect:/loginForm.mem";
		}
		
		List<Integer> oddArr = codao.getOrderDetails(loginInfo.getId());
		
		PrintWriter out = null;
		if(!oddArr.contains(conum)) {
			try {
				out = response.getWriter();
				out.print("<script>alert('해당 강의를 구매하지 않았습니다');location.href='detail.cos?conum="+conum+"';</script>");
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			return "redirect:/detail.cos?conum=" +conum;				
		}
		else {
			return gotoPage + "?conum=" + conum;			
		}
		
	}
	
}
