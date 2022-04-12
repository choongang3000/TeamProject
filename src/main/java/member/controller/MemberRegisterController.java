package member.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberRegisterController {
	private final String command = "register.mem";
	private final String getPage = "memberRegisterForm";
	private String gotoPage="redirect:/register.mem";//이부분 고쳐야할듯..?.
					
	@Autowired
	private MemberDao memberDao;
	
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doAction() { //GET방식

		return getPage;
	}

	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public ModelAndView doAction(@ModelAttribute("member") @Valid MemberBean member,BindingResult result) {
								//POST방식
		ModelAndView mav = new ModelAndView();
		if(result.hasErrors()) {
			mav.setViewName(getPage);
			return mav;
		}

		int cnt = memberDao.insertMember(member);
			//cnt는...?
		mav.setViewName(gotoPage); //이부분 고쳐야할듯..?.
		return mav;

	}
}