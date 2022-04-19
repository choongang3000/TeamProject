package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import admin.model.CoBean;
import admin.model.CoDao;

@Controller
public class ADCoDetailController {
	private final String command = "codetail.ad";
	private String getPage = "codetail";
	
	@Autowired
	@Qualifier("myCoDao")
	private CoDao codao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public ModelAndView doAction(@RequestParam(value="conum", required=true) String conum) {
		
		CoBean cobean =codao.coursesCount(conum);
		String imageName = cobean.getCoimage();
		String videoName = cobean.getCovideo();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("imageName",imageName);
		mav.addObject("videoName",videoName);
		mav.addObject("cobean",cobean);
		mav.setViewName(getPage);
		
		return mav;
	}
	
}
