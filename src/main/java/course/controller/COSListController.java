package course.controller;

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

import admin.model.CoBean;
import admin.model.CoDao;
import utility.Paging;

@Controller
public class COSListController {
	/*
	 * private final String command = "list.cos"; private String getPage =
	 * "coslist";
	 * 
	 * @Autowired private CoDao codao;
	 * 
	 * @RequestMapping(value=command,method=RequestMethod.GET) public ModelAndView
	 * doAction(
	 * 
	 * @RequestParam(value="keyword", required=false) String keyword,
	 * 
	 * @RequestParam(value="whatColumn",required = false) String whatColumn,
	 * 
	 * @RequestParam(value="pageNumber", required=false) String pageNumber,
	 * HttpServletRequest request) {
	 * 
	 * Map<String, String> map = new HashMap<String, String>();
	 * map.put("whatColumn", whatColumn); map.put("keyword", "%"+keyword+"%");
	 * System.out.println(map);
	 * 
	 * int totalCount = codao.totalCount(map);
	 * System.out.println("totalCount:"+totalCount);
	 * 
	 * String url=request.getContextPath()+"/"+command; Paging pageInfo=new
	 * Paging(pageNumber, null, totalCount, url, whatColumn, keyword);
	 * 
	 * List<CoBean> list = codao.coursesAllpage(pageInfo, map);
	 * 
	 * ModelAndView mav=new ModelAndView(); mav.addObject("list",list);
	 * mav.addObject("totalCount",totalCount); mav.addObject("pageInfo",pageInfo);
	 * mav.addObject("map",map); mav.setViewName(getPage); return mav;
	 * 
	 * }
	 */
}
