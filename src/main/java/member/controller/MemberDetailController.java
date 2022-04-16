package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberDetailController {
	private final String command = "memdetail.mem";
	private String getPage = "memberDetailView";

	@Autowired
	private MemberDao mdao;

	@RequestMapping(value=command)
	public String doAction(@RequestParam(value="anum", required=true) int anum,
			HttpServletRequest request,
			HttpSession session) {
		
		MemberBean mbean = (MemberBean)session.getAttribute("loginInfo");

		mbean = mdao.selectMember(anum);

		request.setAttribute("mbean", mbean);

		return getPage;
	}

}
