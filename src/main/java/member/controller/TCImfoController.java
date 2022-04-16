package member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.TeacherBean;
import member.model.MemberDao;

@Controller
public class TCImfoController {
	
	private final String command = "tcInfo.mem";
	private String getPage = "tcInfo";
	
	@Autowired
	private MemberDao mdao;
	
	@RequestMapping(command)
	public String doAction(HttpServletRequest request,
							@RequestParam(value="anum", required=true) String anum) {
		
		TeacherBean tbean = mdao.getTeacherData(anum);
		
		request.setAttribute("tbean", tbean);
		
		return getPage;
	}
}
