package board.CsController;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.Csmodel.boardCsBean;
import board.Csmodel.boardCsDao;

@Controller
public class BCsReplyController {
		
	private final String command ="reply.bod";
	private String getPage = "replyForm";
	
	@Autowired
	private boardCsDao csdao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public ModelAndView doAction(@RequestParam(value="ref", required= true) String ref,
								@RequestParam(value="re_step", required= true) String re_step,
								@RequestParam(value="re_level", required= true) String re_level,
								@RequestParam(value="pageNumber", required= true) String pageNumber) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("ref",ref);
		mav.addObject("re_step",re_step);
		mav.addObject("re_level",re_level);
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName(getPage);
		
		return mav;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String doAction(@RequestParam(value="pageNumber", required=false) String pageNumber,
							boardCsBean bb, HttpServletRequest request) {
		Timestamp reg_date = new Timestamp(System.currentTimeMillis());
		bb.setReg_date(reg_date);
		
		//String ip = request.getRemoteAddr();
		//bb.setIp(ip);
		
		csdao.replyArticle_1(bb);
		csdao.replyArticle_2(bb);
		
		return "redirect:/list.bod?pageNumber=" + pageNumber;
	}
								
								
	
	
}
