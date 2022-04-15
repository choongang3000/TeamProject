package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boardt.model.BTBean;
import member.model.MemberBean;
import member.model.MemberDao;


@Controller
public class MemberUpdateController {
	private final String command = "update.mem";
	private String getPage = "memberUpdateForm";
	private String gotoPage = "redirect:/mypage.mem";
	
	@Autowired
	private MemberDao mdao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(@RequestParam(value="anum",required=true) String anum,
							HttpServletRequest request) {
		
		MemberBean mbean = mdao.selectMember(anum);
		request.setAttribute("mbean", mbean);;
		
		return getPage;
	}

	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView doAction(@Valid @ModelAttribute("mbean") MemberBean mbean,
									HttpServletResponse response) {
		
		mbean.setAddr(mbean.getAddr_num()+"|"+mbean.getAddr_first()+"|"+mbean.getAddr_last());

		ModelAndView mav = new ModelAndView();
		mdao.updateMember(mbean);
		mav.setViewName("redirect:/gotoPage");
		
		return mav;
	}
	
	
}