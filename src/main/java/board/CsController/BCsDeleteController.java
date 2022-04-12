package board.CsController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.Csmodel.boardCsBean;
import board.Csmodel.boardCsDao;

@Controller
public class BCsDeleteController {
	
	private final String command = "delete.bod";
	private String getPage = "deleteForm";
	
	@Autowired
	private boardCsDao csdao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction1(@RequestParam(value="num", required=true) String num,
							@RequestParam(value="pageNumber", required=true) String pageNumber, 
							HttpServletRequest request,
							HttpServletResponse response) {
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
			return "redirect:/Cslist.bod?pageNumber=" + pageNumber;
		}
		else {
			PrintWriter out;
			try {
				out = response.getWriter();
				out.print("<script>alert('이게 뭐라쓴거지')</script>");
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
