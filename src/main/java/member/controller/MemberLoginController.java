package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

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
public class MemberLoginController {

	private final String command = "loginForm.mem";
	private final String getPage = "memberLoginForm";
	private final String gotoPage = "redirect:/home.us";
	// /WEB-INF/member/memberLoginForm.jsp

	@Autowired
	private MemberDao memberDao;


	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doAction() {
		return getPage;
	}

	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String doAction(@Valid LoginBean bean, 
							HttpServletResponse response, 
							HttpSession session) {

		response.setContentType("text/html; charset=UTF-8");

		MemberBean mbean =  memberDao.searchId(bean.getId());
		
		PrintWriter out = null;
		if(mbean == null) {

			try {
				out = response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}
			out.print("<script>alert('해당 아이디가 존재하지 않습니다.');</script>");
			out.flush();
			return getPage;
		}//if
		
		else {

			if(mbean.getPw().equals(bean.getPw())) {
				session.setAttribute("loginInfo", mbean);
				String destination = (String)session.getAttribute("destination");
				return "redirect:/home.us"; // 여기 수정 destination으로
			}
			else {
				try {
					out=response.getWriter();
				} catch (IOException e) {
					e.printStackTrace();
				}
				out.print("<script>alert('비밀번호가 일치하지 않습니다');</script>");
				out.flush();
			}
			return getPage;
		}
	}
	
	@Autowired
    private KakaoService kakao;

	@RequestMapping(value="kakao.mem", method = RequestMethod.GET)
    public String kakaologin(@RequestParam("code") String code, HttpSession session) {
        String access_Token = kakao.getAccessToken(code);
        HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
        System.out.println("login Controller : " + userInfo);
        
//      클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
        if (userInfo.get("email") != null) {
            session.setAttribute("userId", userInfo.get("email"));
            session.setAttribute("userName", userInfo.get("nickname"));
            session.setAttribute("access_Token", access_Token);
        }
        return gotoPage;
    }
	
	@RequestMapping(value="logout.mem")
	public String logout(HttpSession session) {
	    kakao.kakaoLogout((String)session.getAttribute("access_Token"));
	    session.removeAttribute("access_Token");
	    session.removeAttribute("userId");
	    session.invalidate();
	    return gotoPage;
	}


}