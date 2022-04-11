package boards.controller;

import java.io.IOException;
import java.io.PrintWriter;

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

import boards.model.BSBean;
import boards.model.BSDao;

@Controller
public class BSUpdateController {
	private final String command = "update.bs";
	private String getPage = "updateForm";
	private BSBean bsbean;
	@Autowired
	private BSDao bsdao;

	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(@RequestParam(value="num", required=true) String num,
			@RequestParam(value="pageNumber", required=true) String pageNumber,
			Model model) {

		bsbean = bsdao.getArticle(num);

		model.addAttribute("bb",bsbean);
		model.addAttribute("pageNumber",pageNumber);

		return getPage;
	}

	@RequestMapping(value=command, method=RequestMethod.POST)
	public String doAction(@RequestParam(value="pageNumber", required=true) String pageNumber,
										@Valid @ModelAttribute("bb") BSBean bb,
										BindingResult result,
										HttpServletResponse response) {

		response.setContentType("text/html;charset=UTF-8");
		
		if(result.hasErrors()) {
			return getPage;
		}
		
		if(bsbean.getPasswd().equals(bb.getPasswd())) {
			bsdao.updateArticle(bb);
			return "redirect:/list.bs?pageNumber="+pageNumber;	
		}
		else {
			try {
				PrintWriter out = response.getWriter();
				out.print("<script>alert('비밀번호가 일치하지 않습니다')</script>");
				out.flush();
			} catch (IOException e) {
				System.out.println("BSUpdateController 비밀번호 일치 오류");
			}
			return getPage;
		}
	}
}
