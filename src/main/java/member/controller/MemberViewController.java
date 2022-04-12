package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberViewController {
	private final String command="/detail.mem";
	private String getPage="memberDetailView";
	
	@Autowired
	private MemberDao mdao;
	
	@RequestMapping(value = command ,method = RequestMethod.GET)
	public String doAction(
			@RequestParam(value = "id",required = true) String id,
			@RequestParam(value = "pw",required = true) String pw,
			Model model) {
		
		MemberBean bean = mdao.getMember(id);
		model.addAttribute("pw", pw);
		model.addAttribute("bean", bean);
		
		return getPage;
	}

}
