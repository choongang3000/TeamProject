package boards.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
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

import admin.model.CoBean;
import admin.model.CoDao;
import admin.model.TeacherBean;
import admin.model.TeacherDao;
import boards.model.BSBean;
import boards.model.BSDao;
import member.model.MemberBean;

@Controller
public class BSUpdateController {
	private final String command = "update.bs";
	private String getPage = "updateForm";
	private BSBean bsbean;
	@Autowired
	private BSDao bsdao;

	/*
	@Autowired
	private CoDao codao;
	
	@Autowired
	private TeacherDao tdao;
	*/

	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(@RequestParam(value="num", required=true) String num,
			@RequestParam(value="pageNumber", required=true) String pageNumber,
			Model model,
			HttpSession session) {
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		
		List<Integer> oddConumArr = bsdao.getOddConums(loginInfo.getId());
		
		ArrayList<String> conameArr = new ArrayList<String>();
		ArrayList<String> teacherArr = new ArrayList<String>();
		for(Integer conum : oddConumArr) {
			conameArr.add(bsdao.getConame(conum));
			teacherArr.add(bsdao.getCoteacher(conum));
		}
		
		model.addAttribute("conameArr", conameArr);
		model.addAttribute("teacherArr", teacherArr);
		
		bsbean = bsdao.getArticle(num);

		model.addAttribute("bb",bsbean);
		model.addAttribute("pageNumber",pageNumber);

		return getPage;
	}

	@RequestMapping(value=command, method=RequestMethod.POST)
	public String doAction(@RequestParam(value="pageNumber", required=true) String pageNumber,
										@Valid @ModelAttribute("bb") BSBean bb,
										BindingResult result,
										HttpServletResponse response) {

		response.setContentType("text/html;charset=UTF-8");
		
		if(result.hasErrors()) {
			return getPage;
		}
		
		if(bsbean.getPasswd().equals(bb.getPasswd())) {
			bsdao.updateArticle(bb);
			return "redirect:/list.bs?pageNumber="+pageNumber;	
		}
		else {
			try {
				PrintWriter out = response.getWriter();
				out.print("<script>alert('비밀번호가 일치하지 않습니다')</script>");
				out.flush();
			} catch (IOException e) {
				System.out.println("BSUpdateController 비밀번호 일치 오류");
			}
			return getPage;
		}
	}
}
