package member.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.LoginBean;
import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MypageController {
	private final String command = "mypage.mem";
	private String getPage = "mypage";
	
	@Autowired
	private MemberDao mdao;
	
	@Autowired
	ServletContext servletContext;
	
	// main > mypage.jsp 버튼, 로그인 성공
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doAction( HttpServletResponse response, 
							HttpSession session) {
		
		MemberBean mbean = (MemberBean)session.getAttribute("loginInfo");
		
		System.out.println("loginInfo:"+session.getAttribute("loginInfo")); // null
		
		if(session.getAttribute("loginInfo") == null) { // 로그인 안 한 상태
			return "redirect:/loginForm.mem";
		}
		else if(mbean.getType().equals("admin")) { // 어드민 로그인
			return "../admin/adhome"; // adminpage
		}
		else if(mbean.getType().equals("teacher")) { // 선생님 로그인
			return "tcmypage"; // tcmypage
		}
		else {// 회원 로그인 한 상태
			return getPage;// mypage.jsp
		}
	}
	
}
