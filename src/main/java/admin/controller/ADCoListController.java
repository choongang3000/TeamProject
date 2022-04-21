package admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.CoBean;
import admin.model.CoDao;
import utility.Paging;

@Controller
public class ADCoListController {
	private final String command = "colist.ad";
	private String getPage = "colist";
	
	@Inject
	@Qualifier("myCoDao")
	private CoDao codao;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doAction(@RequestParam(value="pageNumber",required = false) String pageNumber,
							@RequestParam(value="whatColumn",required = false) String whatColumn,
			   			   @RequestParam(value="keyword",required = false) String keyword,
			   			   HttpServletRequest request) {
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		//String keyword2 = keyword.toUpperCase();
		//System.out.println("keyword:"+keyword.toUpperCase());
		//System.out.println("keyword2"+keyword2);
		
		String url = request.getContextPath() + "/" + command;
		
		int totalCount = codao.totalCount(map);
		Paging pageInfo = new Paging(pageNumber,null,totalCount,url,whatColumn,keyword);
		List<CoBean> colist = codao.coursesAllpage(pageInfo,map);
		
		request.setAttribute("pageInfo",pageInfo);
		request.setAttribute("colist", colist);
		
		return getPage;
	}

}