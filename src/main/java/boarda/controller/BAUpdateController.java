package boarda.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
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

import boarda.model.BABean;
import boarda.model.BADao;

@Controller
public class BAUpdateController {
	
	private final String command = "update.ba";
	private String getPage = "updateForm";
	private BABean bean;
	
	@Autowired
	private BADao baDao;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doAction(
							@RequestParam(value="banum", required=true) String banum,
							@RequestParam(value="pageNumber", required=true) int pageNumber,
							Model model) {
		
		bean = baDao.getBA(banum);
		
		model.addAttribute("ba", bean);
		model.addAttribute("pageNumber",pageNumber);

		return getPage;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String doAction(@RequestParam(value="pageNumber",required = true) int pageNumber,
								@Valid @ModelAttribute ("ba") BABean ba,
								BindingResult result,
								HttpServletResponse response) {
		
		response.setContentType("text/html;charset=UTF-8");
		
		if(result.hasErrors()) {
			return getPage;
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