package board.CsController;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.Csmodel.boardCsBean;
import board.Csmodel.boardCsDao;
import member.model.MemberBean;

@Controller
public class BCsDetailController {
	
	private final String command = "detail.bod";
	private String getPage = "content";
	
	@Autowired
	private boardCsDao csdao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public ModelAndView doAction(@RequestParam(value="num", required=true) String num,
								@RequestParam(value="pageNumber", required=true) String pageNumber,
								HttpSession session) {
		
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		
		csdao.addReadCount(num);
		boardCsBean csBean = csdao.getArticle(num);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("loginInfo",loginInfo);
		mav.addObject("bb",csBean);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName(getPage);
		
		return mav;
	}
	
}
