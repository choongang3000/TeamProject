package boards.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import boards.model.BSBean;
import boards.model.BSDao;

@Controller
public class BSDeleteController {

	private final String command = "delete.bs";
	private String getPage = "deleteForm";
	
	@Inject
	private BSDao bsdao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(@RequestParam(value="num", required=true) String num,
						   @RequestParam(value="pageNumber", required=true) String pageNumber,
						   HttpServletRequest request) {
		
		request.setAttribute("num", num);
		request.setAttribute("pageNumber", pageNumber);
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String doAction(@RequestParam(value="num", required=true) String num,
			@RequestParam(value="pageNumber", required=true) String pageNumber,
			@RequestParam(value="passwd", required=true) String passwd,
			HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("삭제num:"+num);
		System.out.println("삭제passwd:"+passwd);
		response.setContentType("text/html;charset=UTF-8");
		
		BSBean bb = bsdao.getArticle(num);
		
		if(bb.getPasswd().equals(passwd)) {
			bsdao.deleteArticle(num);
			return "redirect:/list.bs?pageNumber=" + pageNumber;
		}
		
		else {
			try {
				PrintWriter out = response.getWriter();
				out.print("<script>alert('비밀번호가 일치하지 않습니다.')</script>");
				out.flush();
			} catch (IOException e) {
				System.out.println();
			}
			request.setAttribute("num", num);
			request.setAttribute("pageNumber", pageNumber);
			return getPage;
		}
	}
}
