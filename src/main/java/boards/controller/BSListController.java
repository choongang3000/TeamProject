package boards.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boards.model.BSBean;
import boards.model.BSDao;
import utility.Paging;

@Controller
public class BSListController {
	private final String command = "list.bs";
	private String getPage = "list";
	@Inject
	private BSDao bsdao ;
	
	@RequestMapping(value=command)
	public String doAction(@RequestParam(value="pageNumber",required = false) String pageNumber, 
					       @RequestParam(value="whatColumn",required = false) String whatColumn,
						   @RequestParam(value="keyword",required = false) String keyword,
						   HttpServletRequest request) {
		
		
		Map<String, String> map = new HashMap<String,String>();

		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");

		int totalCount = bsdao.getArticleCount(map);
		String url = request.getContextPath() +"/"+command;
		Paging pageInfo = new Paging(pageNumber,null,totalCount,url,whatColumn,keyword);
		
		List<BSBean> list = bsdao.getArticles(map,pageInfo);
		
		request.setAttribute("totalCount",totalCount);
		request.setAttribute("pageInfo",pageInfo);
		request.setAttribute("list",list);
		
		return getPage;
	}
}
