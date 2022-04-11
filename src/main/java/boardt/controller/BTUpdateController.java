package boardt.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import boardt.model.BTBean;
import boardt.model.BTDao;

@Controller
public class BTUpdateController {
	
	private final String command = "update.bt";
	private String getPage = "btupdateform";
	
	@Autowired
	private BTDao btdao;
	
	private BTBean btbean;
	
	@RequestMapping(value=command)
	public String doAction() {
		return getPage;
	}

	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(
			@RequestParam(value="num", required=true) String num,
			@RequestParam(value="pageNumber", required=true) String pageNumber,
			Model model) {

		btbean = btdao.getNumBoardList(num); //전체 조회해서 빈에 넣고..

		List<String> sub = btdao.getSubList();
		model.addAttribute("sub",sub);
		
		model.addAttribute("bt",btbean);
		model.addAttribute("pageNumber",pageNumber);

		return getPage;
	}

	@RequestMapping(value=command, method=RequestMethod.POST)
	public String doAction(
			@RequestParam(value="pageNumber", required=true) String pageNumber,
			@ModelAttribute("bt") @Valid BTBean bt, BindingResult result,
			HttpServletRequest request,
			HttpServletResponse response) {
			
			response.setContentType("text/html;charset=UTF-8");
			//ModelAndView mav = new ModelAndView();
			//mav.addObject("pageNumber",pageNumber);
			System.out.println("여기~~"+bt.getSubject());
			System.out.println("여기~~"+bt.getExamfile());
			System.out.println("여기~~"+bt.getAnswer());
			System.out.println("여기~~"+bt.getPasswd());
			System.out.println("여기~~"+bt.getQuizimg());
			System.out.println("여기~~"+bt.getMovingimg());

			if(result.hasErrors()) {
				List<String> sub = btdao.getSubList();
				request.setAttribute("sub", sub);
				return getPage; //에러가 있으면 돌아가라!
			}
			
			if(btbean.getPasswd().equals(bt.getPasswd())) {
				btdao.btupdate(bt);
				return "redirect:/list.bt?pageNumber="+pageNumber;	
			}
			else {
				try {
					PrintWriter out = response.getWriter();
					out.print("<script>alert('비밀번호가 일치하지 않습니다')</script>");
					out.flush();
				} catch (IOException e) {
				}
				return getPage;
			}
	}
	
}
