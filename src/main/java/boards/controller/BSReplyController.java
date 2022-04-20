/* 사용안함
package boards.controller;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.ibatis.type.IntegerTypeHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boards.model.BSBean;
import boards.model.BSDao;

@Controller
public class BSReplyController {
	
	private final String command = "reply.bs";
	private String getPage = "replyForm";
	private String gotoPage = "redirect:/list.bs";
	@Autowired
	private BSDao bsdao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public ModelAndView doAction(@RequestParam(value="ref", required=true) String ref,
							     @RequestParam(value="re_step", required=true) String re_step,
							     @RequestParam(value="re_level", required=true) String re_level,
							     @RequestParam(value="pageNumber", required=true) String pageNumber) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("ref",ref);
		mav.addObject("re_step",re_step);
		mav.addObject("re_level",re_level);
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName(getPage);
		
		return mav;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView doAction(
						@RequestParam(value="ref", required=true) String ref,
					     @RequestParam(value="re_step", required=true) String re_step,
					     @RequestParam(value="re_level", required=true) String re_level,
						@RequestParam(value="pageNumber", required=true) String pageNumber,
						   @Valid BSBean bb,
						   BindingResult result,
						   HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		
		if(result.hasErrors()) {
			mav.addObject("ref",ref);
			mav.addObject("re_step",re_step);
			mav.addObject("re_level",re_level);
			mav.addObject("pageNumber",pageNumber);
			System.out.println("pageNumber:"+pageNumber);
			System.out.println(bb.getRef());
			System.out.println(bb.getRe_level());
			System.out.println(bb.getRe_step());
			
			mav.setViewName(getPage);
			return mav;
		}
		
		Timestamp reg_date =  new Timestamp(System.currentTimeMillis());
		//내컴퓨터의 현재 시간(1970-1-1 00:00:00부터 지금시간까지 흘러온 시간)을 Timestamp class로 날짜형태로 바꿈 
		bb.setReg_date(reg_date);
		
		bsdao.replyArticle(bb);
		
		mav.addObject("ref",ref);
		mav.addObject("re_step",re_step);
		mav.addObject("re_level",re_level);
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName(gotoPage);
		return mav;
		
		//return "redirect:/list.bs?pageNumber="+pageNumber;
		//return "redirect:/list.bs";
	}
}
*/