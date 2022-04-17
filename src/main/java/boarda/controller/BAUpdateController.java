package boarda.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
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
	private String gotoPage = "redirect:/list.ba";
	private BABean babean;
	
	@Autowired
	private BADao baDao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doAction(
							@RequestParam(value="banum", required=true) String banum,
							@RequestParam(value="pageNumber", required=true) int pageNumber,
							Model model) {
		
		babean = baDao.getBA(banum);
		
		model.addAttribute("babean", babean);
		model.addAttribute("pageNumber",pageNumber);

		return getPage;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public ModelAndView doAction(@RequestParam(value="pageNumber",required = true) int pageNumber,
								@Valid @ModelAttribute ("babean") BABean babean,
								BindingResult result,
								HttpServletResponse response) {
		
		response.setContentType("text/html;charset=UTF-8");
		
		ModelAndView mav = new ModelAndView();
		baDao.updateBA(babean);
		mav.setViewName(gotoPage);
		
		return mav;
	}
}