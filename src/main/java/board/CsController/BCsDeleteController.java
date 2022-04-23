package board.CsController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.Csmodel.boardCsBean;
import board.Csmodel.boardCsDao;
import member.model.MemberBean;

@Controller
public class BCsDeleteController {
	
	private final String command = "delete.bod";
	private String getPage = "deleteForm";
	private String gotoPage = "redirect:/list.bod";
	
	@Autowired
	private boardCsDao csdao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction1(@RequestParam(value="num", required=true) String num,
							@RequestParam(value="pageNumber", required=true) String pageNumber, 
							HttpServletRequest request,
							HttpServletResponse response,
							HttpSession session) {
		
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		if(loginInfo.getType().equals("admin")) {
			csdao.deleteArticle(num);
			
			return gotoPage + "?pageNumber=" + pageNumber;
		}
		
		
		request.setAttribute("num", num);
		request.setAttribute("pageNumber", pageNumber);	
		
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String doAction2(@RequestParam(value="num", required=true) String num, 
							@RequestParam(value="pageNumber", required=true) String pageNumber,
							@RequestParam(value="passwd", required=true) String passwd,
							HttpServletRequest request,
							HttpServletResponse response) {
		
		response.setContentType("text/html;charset=UTF-8");
		boardCsBean csBean = csdao.getArticle(num);
		if(csBean.getPasswd().equals(passwd)){
			csdao.deleteArticle(num);
			return  gotoPage + "?pageNumber=" + pageNumber;
		}
		else {
			PrintWriter out;
			try {
				out = response.getWriter();
				out.print("<script>alert('게시글 비밀번호가 일치하지 않습니다.')</script>");
				out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("num", num);
			request.setAttribute("pageNumber", pageNumber);
			
			return getPage;
		}
		
		

	}
	
	
}
