package board.CsController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.Csmodel.boardCsBean;
import board.Csmodel.boardCsDao;

@Controller
public class BCsUpdateController {
		
	private final String command = "update.bod";
	private String getPage = "updateForm";
	private boardCsBean Csboard;
	
	@Autowired
	private boardCsDao csdao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(@RequestParam(value="num", required=true) String num,
							@RequestParam(value="pageNumber", required=true) String pageNumber,
							Model model) {
		
		Csboard = csdao.getArticle(num);
		
		model.addAttribute("bb",Csboard );
		model.addAttribute("pageNumber",pageNumber);
		
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String doAction(@RequestParam(value="pageNumber", required=true) String pageNumber,
							@ModelAttribute("bb") boardCsBean bb,
							HttpServletResponse response) {
		
		response.setContentType("text/html;charset=UTF-8");
		if(Csboard.getPasswd().equals(bb.getPasswd())) {
			csdao.updateArticle(bb);
			
			return "redirect:/Cslist.bod?pageNumber="+pageNumber;
		}
		else {
				
				try {
					PrintWriter out = response.getWriter();
					out.print("<script>alert('여긴 뭐라쓴거지')</script>");
					out.flush();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return getPage;
		}
		
		
	
	}
}
