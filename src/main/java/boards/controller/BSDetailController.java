package boards.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boards.model.BSBean;
import boards.model.BSDao;

@Controller
public class BSDetailController {
	private final String command = "detail.bs";
	private String getPage = "content";
	
	@Autowired
	private BSDao bsdao;
	
	//@Qualifier("myCoDao")
	//@Autowired
	//private CoDao codao;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public ModelAndView doAction(@RequestParam(value="num", required=false) String num,
			@RequestParam(value="pageNumber", required=false) String pageNumber) {
		
		bsdao.addReadCount(num);
		
		BSBean bsbean = bsdao.getArticle(num);
		String imageName = bsbean.getImage();
		
		//CoBean cobean = codao.coursesCount(num);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("imageName",imageName);
		mav.addObject("bb",bsbean);
		mav.addObject("pageNumber",pageNumber);
		//mav.addObject("cobean",cobean);
		mav.setViewName(getPage);
		return mav;
		
	}
	
}
