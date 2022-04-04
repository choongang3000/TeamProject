package boardst.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boardst.model.BSTBean;
import boardst.model.BSTDao;

@Controller
public class BSTUpdateController {
	
	private final String command = "update.bst";
	private String getPage = "boardst_updateForm";
	
	@Autowired
	private BSTDao bstdao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public ModelAndView doAction(@RequestParam(value="num", required=true) int num,
							@RequestParam(value="pageNumber", required=true) String pageNumber) {
		
		BSTBean board = bstdao.getBoardByNum(num);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("board",board);
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName(getPage);
		
		return mav;
	}

	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView doAction(@RequestParam(value="pageNumber", required=true) String pageNumber,
									BSTBean bstbean) {
		
		int cnt = bstdao.updateBoard(bstbean);
		
		ModelAndView mav = new ModelAndView();
		
		if(cnt>0) {
			mav.setViewName("redirect:/detail.bst?num="+bstbean.getNum()+"&pageNumber="+pageNumber);
		}
		
		return mav;
	}
	
	
}
