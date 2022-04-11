package admin.controller;

import java.util.List;

import javax.inject.Inject;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import admin.model.CoBean;
import admin.model.CoDao;
import admin.model.SubBean;
import admin.model.SubDao;

@Controller
public class ADCoUpdateController {
	private final String command = "coupdate.ad";
	private String getPage = "coupdateForm";
	private String gotoPage = "redirect:/colist.ad";
	@Inject
	private CoDao codao;
	@Inject
	private SubDao subdao;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doAction(@RequestParam(value="conum", required=true) String conum,Model model) {
		List<SubBean> sublist = subdao.subjectAll();
		CoBean cobean = codao.coursesCount(conum);
		String imageName = cobean.getCoimage();
		String videoName = cobean.getCovideo();
		
		model.addAttribute("cobean",cobean);
		model.addAttribute("sublist",sublist);
		model.addAttribute("imageName",imageName); //이렇게 넘기는게 맞는지? => 미해결
		model.addAttribute("videoName",videoName); //이렇게 넘기는게 맞는지? => 미해결
		return getPage;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public ModelAndView doAction(@Valid CoBean cobean, BindingResult result) {
		ModelAndView mav = new ModelAndView();
		
		codao.updateCourses(cobean);
		
		if(result.hasErrors()) {
			mav.setViewName(getPage);
			return mav;
		}
		
		mav.setViewName(gotoPage);
		return mav;
	}
	
}
