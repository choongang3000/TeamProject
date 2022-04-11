package boardt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boardt.model.BTBean;
import boardt.model.BTDao;

@Controller
public class BTDetailController {

	@Autowired
	private BTDao btdao;
	
	//.btø‰√ª
	private final String command="detail.bt";
	private String getPage="btcontent";
	
	@RequestMapping(value=command)
	public ModelAndView doAction(
			@RequestParam(value="num", required=true) String num ,
			@RequestParam(value="pageNumber", required=true) String pageNumber) {
	
		BTBean btbean = btdao.getNumBoardList(num);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("bt",btbean);
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName(getPage);
		return mav;
	}
}
