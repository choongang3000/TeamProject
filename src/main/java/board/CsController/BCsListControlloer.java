package board.CsController;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.Csmodel.boardCsBean;
import board.Csmodel.boardCsDao;
import utility.Paging;

@Controller
public class BCsListControlloer {
	
	private final String command = "list.bod";
	private String getPage = "list";
	
	@Autowired
	private boardCsDao csdao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(@RequestParam(value="pageNumber", required= false) String pageNumber, HttpServletRequest request) {
		
		int totalCount = csdao.getArticleCount();
		String url = request.getContextPath()+ "/"+command;
		
		Paging pageInfo = new Paging(pageNumber,"7",totalCount,url,null,null);
		
		List<boardCsBean> boardArr = csdao.getArticles(pageInfo);
		
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("pageInfo", pageInfo);
		/* request.setAttribute("totalCount", totalCount); 중복 */
		
		request.setAttribute("boardArr", boardArr); 
		/* 성은님 조언대로 추가 */
		return getPage;
	}
	
	
}
