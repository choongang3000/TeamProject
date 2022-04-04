package boardst.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boardst.model.BSTDao;

@Controller
public class BSTDeleteReplyController {
	
	private final String command = "deleteReply.bst";
	private String gotoPage="redirect:/detail.bst";
	
	@Autowired
	private BSTDao bstdao; 
	
	@RequestMapping(value=command)
	public String doAction(@RequestParam(value="replyNum", required=true) int replyNum,
							@RequestParam(value="num", required=true) int num,
							@RequestParam(value="pageNumber", required=true) String pageNumber,
							HttpServletRequest request,
							HttpServletResponse response) {
		
		response.setContentType("text/html;charset=UTF-8");
		
		int cnt = bstdao.deleteReply(replyNum);
		int cnt2 = bstdao.updateCheck_delete(num);
		
		if(cnt<=0 || cnt2<=0 ) {
			try {
				PrintWriter out = response.getWriter();
				out.print("<script>alert('오류 발생. 삭제 실패')</script>");
				out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		return gotoPage + "?pageNumber=" +pageNumber + "&num=" + num;
	}
	
}
