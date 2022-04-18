package boarda.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boarda.model.BABean;
import boarda.model.BADao;
import utility.Paging;

@Controller
public class UserBAListController {
	
	private final String command = "/userlist.ba";
	private String getPage = "userBoarda";
	
	@Autowired
	private BADao badao;

	@RequestMapping(command)
	public ModelAndView doAction(
			@RequestParam(value="keyword", required=false) String keyword,
			@RequestParam(value="bacategory", required=false) String bacategory,			
			@RequestParam(value="pageNumber", required=false) String pageNumber,
			HttpServletRequest request) {
		
		System.out.println(bacategory);
		Map<String, String> map = new HashMap<String, String>();
		map.put("bacategory", bacategory);
		map.put("keyword", keyword);
		
		System.out.println("여기1!!!");
		System.out.println(map);
		
		int totalCount=badao.totalCount(map);
		System.out.println("totalCount:"+totalCount);
		
		String url=request.getContextPath()+command;
		
		Paging pageInfo=new Paging(pageNumber, "10", totalCount, url, null, keyword);
		
		  
		List<BABean> list = badao.getBAList(pageInfo, map);
		System.out.println("여기!!!!!!! >>> " + list.size());
		ModelAndView mav=new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("totalCount",totalCount);
		mav.addObject("pageInfo",pageInfo);
		mav.setViewName(getPage);
		return mav;
	
	}

	
}
