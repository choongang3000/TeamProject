package board.CsController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.Csmodel.boardCsBean;
import board.Csmodel.boardCsDao;
import member.model.MemberBean;
import utility.COSListPaging;
import utility.Paging;

@Controller
public class BCsListControlloer {
	
	private final String command = "list.bod";
	private String getPage = "list";
	
	@Autowired
	private boardCsDao csdao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(	@RequestParam(value="pageNumber", required= false) String pageNumber, 
							@RequestParam(value="whatColumn", required= false) String whatColumn,
							@RequestParam(value="keyword", required= false) String keyword,
							HttpServletRequest request,
							HttpSession session) {
		
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		//System.out.println("writer:"+writer);
		Map<String, String> map = new HashMap<String, String>();
		/*
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
		*/
		//int totalCount = csdao.getArticlesCount(map);
		int totalCount = csdao.getArticlesCount2();
		//System.out.println("totalCount:"+totalCount);
		
		String url ;
		url = request.getContextPath()+"/"+command;
		/*
		if(writer != null) {
			url = request.getContextPath()+command+"?writer="+writer;
		}
		else {
			url = request.getContextPath()+command;
		}
		*/
		Paging pageInfo = new Paging(pageNumber,"10",totalCount,url,null,null);
		
		//List<boardCsBean> boardArr = csdao.getArticles1(pageInfo,map);
		List<boardCsBean> boardArr = csdao.getArticles2(map,pageInfo);
		
		//ModelAndView mav=new ModelAndView();
		//mav.addObject("writer",writer);
		request.setAttribute("loginInfo", loginInfo);
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("boardArr", boardArr);
		return getPage;
	}
	
	
}