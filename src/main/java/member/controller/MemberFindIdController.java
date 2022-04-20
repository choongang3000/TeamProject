package member.controller;
	

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.LoginBean;
import member.model.MemberBean;
import member.model.MemberDao;
	
@Controller
public class MemberFindIdController {
	
	private final String command = "findid.mem";
	private String getPage = "memberFindIdForm2";
	
	@Autowired
	private MemberDao mdao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction() {
		
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public void doAction(LoginBean logbean, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		
		MemberBean ck = mdao.searchIdByBean(logbean);
		PrintWriter out = response.getWriter();
		// 가입된 아이디가 없으면
		if(ck == null) {
			out.print("<script>alert('등록되지 않은 계정입니다.'); history.back(-1);</script>");
			out.close();
		
		}
		else {
			sendEmail(ck, "findpw");
			
			out.print("<script>alert('이메일로 아이디를 발송하였습니다.'); location.href='loginForm.mem'</script>");
			out.close();
			
		}
		
	}
	
	
	
	public void sendEmail(MemberBean mbean, String div ) {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = "kwonjun2063";
		String hostSMTPpwd = "kj20632063!!";
		
		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "kwonjun2063@gmail.com";
		String fromName = "Jun Kwon";
		String subject = "";
		String msg = "";
		
		if(div.equals("findpw")) {
			subject = "On_인터넷강의 아이디 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += mbean.getAname() + "님의 아이디 입니다.</h3>";
			msg += "<p> 아이디 : ";
			msg += mbean.getId() + "</p></div>";
		}
		
		// 받는 사람 E-Mail 주소
		String mail = mbean.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSLOnConnect(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); //네이버 이용시 587
			
			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}
	 
	
}
