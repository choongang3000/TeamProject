package boardst.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boardst.model.BSTBean;
import boardst.model.BSTDao;
import boardst.model.BSTReplyBean;

@Controller
public class BSTUpdateReplyController {
	
	private final String command = "updateReply.bst";
	private String getPage = "boardst_updateReplyForm";
	
	@Autowired
	private BSTDao bstdao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public ModelAndView doAction(@RequestParam(value="num", required=true) int num,
							@RequestParam(value="pageNumber", required=true) String pageNumber) {

		BSTBean board = bstdao.getBoardByNum(num);
		
		BSTReplyBean reply = bstdao.getBoardReplyByNum(num); 
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("reply",reply);
		mav.addObject("board",board);
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName(getPage);
		
		return mav;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView doAction(@RequestParam(value="pageNumber", required=true) String pageNumber,
									BSTReplyBean bstReplyBean) {
		
		int cnt = bstdao.updateReply(bstReplyBean);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("num",bstReplyBean.getPnum());
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName("redirect:/detail.bst");
		
		return mav;
	}

}
