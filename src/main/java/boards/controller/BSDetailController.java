package boards.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@RequestMapping(value=command)
	public ModelAndView doAction(@RequestParam(value="num", required=true) String num,
			@RequestParam(value="pageNumber", required=true) String pageNumber) {
		
		bsdao.addReadCount(num);
		
		BSBean bsbean = bsdao.getArticle(num);
		
		String imageName = bsbean.getImage();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("imageName",imageName);
		mav.addObject("bb",bsbean);
		mav.addObject("pageNumber",pageNumber);
		
		mav.setViewName(getPage);
		return mav;
		
	}
}
