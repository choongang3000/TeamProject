package boardst.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import boardst.model.BSTDao;
import boardst.model.BSTReplyBean;

@Controller
public class BSTReplyController {
	
	private final String command = "reply.bst";
	private String gotoPage = "redirect:/detail.bst";
	
	@Autowired
	private BSTDao bstdao;
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String doAction(@RequestParam(value="num", required=true) int num,
							@RequestParam(value="pageNumber", required=true) String pageNumber,
							BSTReplyBean replyBean,
							HttpServletResponse response) {
		
		response.setContentType("text/html;charset=UTF-8");
		
		int cnt = bstdao.insertReply(replyBean);
		int cnt2 = bstdao.updateCheck(num);
		
		if(cnt<=0 || cnt2<=0) {
			try {
				PrintWriter out = response.getWriter();
				out.print("<script>alert('에러 발생')</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		
		return gotoPage + "?num=" + num + "&pageNumber=" + pageNumber;
	}
}
