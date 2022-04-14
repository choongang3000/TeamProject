package teachers.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import teachers.model.TEBean;
import teachers.model.TEDao;
import utility.Paging;

@Controller
public class TEListController { // 4/13 JH - TEBean, TEListController, TEDao, teachers.xml, teachersÆú´õ - teacherlist.jsp
	
	private final String command = "/list.te";
	private String getPage = "teacherlist";
	
	@Autowired
	private TEDao tedao;

	@RequestMapping(value=command)
	public ModelAndView doAction( 
			@RequestParam(value="keyword", required=false) String keyword,
			@RequestParam(value="pageNumber", required=false) String pageNumber,
			HttpServletRequest request) {
		
		Map<String, String> map=new HashMap<String, String>();
		
		map.put("keyword", "%"+keyword+"%");
		
		int totalCount=tedao.totalCount(map);
		System.out.println("totalCount:"+totalCount);
		
		String url=request.getContextPath()+command;
		Paging pageInfo=new Paging(pageNumber, null, totalCount, url, null, keyword);
		
		  
		List<TEBean> list = tedao.getTEList(pageInfo, map);
	 
		ModelAndView mav=new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("totalCount",totalCount);
		mav.addObject("pageInfo",pageInfo);
		mav.setViewName(getPage);
		return mav;
	
	}
}
