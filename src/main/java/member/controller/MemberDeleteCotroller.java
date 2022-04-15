package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberDeleteCotroller {
	private final String command = "delete.mem";
	private String getPage = "redirect:/mypage.mem";

	@Autowired
	private MemberDao mdao;


	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction( MemberBean member,
							HttpServletResponse response,
							RedirectAttributes rttr,
							HttpSession session) {

		MemberBean mbean = (MemberBean)session.getAttribute("loginInfo");

		String dbpw = mbean.getPw();
		String pw = member.getPw();

		if(pw.equals(dbpw)) {
			rttr.addFlashAttribute("msg",false);
			return "redirect:/memberdelete.mem";
		}
		
		mdao.deleteMember(mbean);
		session.setAttribute("loginInfo", null);
		
		return "redirect:/";
	}
}
