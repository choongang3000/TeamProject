package accounts.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import accounts.model.ACBean;
import accounts.model.ACDao;

@Controller
public class ACUpdateController {
	private final String command = "update.ac";
	private String getPage = "updateac";
	private ACBean acbean;
	
	@Autowired
	private ACDao acdao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doAction(@RequestParam(value="anum", required=true) int anum,
										@Valid @ModelAttribute("ac") ACBean ac,
										BindingResult result,
										HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		
		if(result.hasErrors()) {
			return getPage;
		}
		
		if(acbean.getPw().equals(ac.getPw())) {
			acdao.updateac(ac);
			return "redirect:/accounts.ac";	
		}
		else {
			try {
				PrintWriter out = response.getWriter();
				out.print("<script>alert('비밀번호가 일치하지 않습니다')</script>");
				out.flush();
			} catch (IOException e) {
				System.out.println("ACUpdateController 비밀번호 일치 오류");
			}
			return getPage;
		}
	}
}
