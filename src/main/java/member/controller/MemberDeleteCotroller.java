package member.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import admin.model.TeacherBean;
import board.Csmodel.boardCsBean;
import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberDeleteCotroller {
	private final String command = "delete.mem";
	private String getPage = "memberDelete";
	private String gotoPage_f = "redirect:/delete.mem";
	private String gotoPage = "redirect:/home.us";

	@Autowired
	private MemberDao mdao;
	
	@RequestMapping(value =command, method = RequestMethod.GET)
	public String doAction(HttpSession session) {
		
		MemberBean mbean = (MemberBean)session.getAttribute("loginInfo");
		
		return getPage;
	}

	@RequestMapping(value=command, method=RequestMethod.POST)
	public String doAction( MemberBean mb,
							HttpSession session,
							HttpServletResponse response) {
		
		response.setContentType("text/html;charset=UTF-8");
		
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		
		String inputpw = mb.getPw();
		
		MemberBean mbean = mdao.getMemberById(loginInfo.getId());
		String dbpw = mbean.getPw();
		
		if(!(inputpw.equals(dbpw))) {
			try {
				PrintWriter out = response.getWriter();
				out.print("<script>alert('비밀번호가 일치하지 않습니다'); history.back(-1);</script>");
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
		else {
			mdao.deleteMember(mb);
			session.invalidate();
			try {
				PrintWriter out = response.getWriter();
				out.print("<script>alert('회원 탈퇴 되었습니다.'); location.href='home.us';</script>");
				out.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
			return gotoPage;
		}
		return gotoPage_f;
	}
}
