package course.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import course.model.COSBean;
import course.model.COSDao;
import utility.Paging;

@Controller
public class COSListController {
	
	private final String command = "/list.cos";
	private String getPage = "coslist";
	
	@Autowired
	private COSDao cosdao;

	@RequestMapping(value=command,method=RequestMethod.GET)
	public ModelAndView doAction(
			@RequestParam(value="whatColumn",required = false) String whatColumn,
			@RequestParam(value="keyword", required=false) String keyword,
			@RequestParam(value="pageNumber", required=false) String pageNumber,
			HttpServletRequest request) {
		
		Map<String, String> map=new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		int totalCount=cosdao.totalCount(map);
		System.out.println("totalCount:"+totalCount);
		
		String url=request.getContextPath()+command;
		Paging pageInfo=new Paging(pageNumber, null, totalCount, url, whatColumn, keyword);
		
		  
		List<COSBean> list = cosdao.getCOSList(pageInfo, map);
	 
		ModelAndView mav=new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("totalCount",totalCount);
		mav.addObject("pageInfo",pageInfo);
		mav.setViewName(getPage);
		return mav;
	
	}

	
}