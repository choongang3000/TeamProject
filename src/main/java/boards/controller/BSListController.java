package boards.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boards.model.BSBean;
import boards.model.BSDao;
import member.model.MemberBean;
import utility.Paging;

@Controller
public class BSListController {
	private final String command = "list.bs";
	private String getPage = "list";
	@Inject
	private BSDao bsdao ;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(@RequestParam(value="aname", required=false) String writer,
						@RequestParam(value="pageNumber",required = false) String pageNumber, 
					       @RequestParam(value="whatColumn",required = false) String whatColumn,
						   @RequestParam(value="keyword",required = false) String keyword,
						   HttpServletRequest request, HttpSession session) {
		
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		
		Map<String, String> map = new HashMap<String,String>();
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
		
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");

		int totalCount = bsdao.getArticleCount(map);
		
		String url ;
		if(writer != null) {
			url = request.getContextPath()+command+"?writer="+writer;
		}
		else {
			url = request.getContextPath()+command;
		}
		
		Paging pageInfo = new Paging(pageNumber,null,totalCount,url,whatColumn,keyword);
		
		List<BSBean> list = bsdao.getArticles(map,pageInfo);
		ModelAndView mav=new ModelAndView();
		mav.addObject("writer",writer);
		request.setAttribute("totalCount",totalCount);
		request.setAttribute("pageInfo",pageInfo);
		request.setAttribute("list",list);
		
		return getPage;
	}
	
}