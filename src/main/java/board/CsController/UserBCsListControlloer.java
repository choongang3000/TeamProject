package board.CsController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.Csmodel.boardCsBean;
import board.Csmodel.boardCsDao;
import utility.Paging;

@Controller
public class UserBCsListControlloer {
	
	private final String command = "userlist.bod";
	private String getPage = "userlist";
	
	@Autowired
	private boardCsDao csdao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(@RequestParam(value="aname", required=false) String writer,
							@RequestParam(value="pageNumber", required= false) String pageNumber, HttpServletRequest request) {
		
		Map<String, String> map=new HashMap<String, String>();
		if(writer != null) {
	         if(writer.equals("")) {
	            map.put("writer", null);
	         }
	         else {
	            map.put("writer", writer);
	         }
	      }   
	      else {
	         map.put("writer", writer);
	      }
		
		int totalCount = csdao.getArticlesCount(map);
		System.out.println("totalCount:"+totalCount);
		
		String url ;
		if(writer != null) {
			url = request.getContextPath()+command+"?writer="+writer;
		}
		else {
			url = request.getContextPath()+command;
		}
		
		Paging pageInfo = new Paging(pageNumber,"7",totalCount,url,null,null);
		
		List<boardCsBean> boardArr = csdao.getArticles(pageInfo,map);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("boardArr",boardArr);
		mav.addObject("pageInfo",pageInfo);
		mav.addObject("totalCount",totalCount);
		mav.addObject("writer",writer);

		return getPage;
	}
	
	
}
