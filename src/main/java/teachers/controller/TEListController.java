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

import course.model.COSDao;
import teachers.model.TEBean;
import teachers.model.TEDao;
import utility.COSListPaging;
import utility.Paging;

@Controller
public class TEListController { // 4/13 JH - TEBean, TEListController, TEDao, teachers.xml, teachers폴더 - teacherlist.jsp
	
	private final String command = "/list.te";
	private String getPage = "teacherlist";
	
	@Autowired
	private TEDao tedao;

	@Autowired
	private COSDao cosdao;
	
	@RequestMapping(value=command)
	public ModelAndView doAction( 
			@RequestParam(value="keyword", required=false) String keyword,
			@RequestParam(value="pageNumber", required=false) String pageNumber,
			@RequestParam(value="cosubject", required=false) String cosubject,
			HttpServletRequest request) {
		
		Map<String, String> map=new HashMap<String, String>();
		
		map.put("keyword", "%"+keyword+"%");
		if(cosubject != null) {
	         if(cosubject.equals("")) {
	            map.put("cosubject", null);
	         }
	         else {
	            map.put("cosubject", cosubject);
	         }
	      }   
	      else {
	         map.put("cosubject", cosubject);
	      }
		
		int totalCount=tedao.totalCount(map);
		System.out.println("totalCount:"+totalCount);
		
		String url ;
		if(cosubject != null) {
			url = request.getContextPath()+command+"?cosubject="+cosubject;
		}
		else {
			url = request.getContextPath()+command;
		}
		
		COSListPaging pageInfo=new COSListPaging(pageNumber, null, totalCount, url, null, keyword);
		
		  
		List<TEBean> list = tedao.getTEList(pageInfo, map);
		TEBean comp = list.get(0); //KJH : 조회하면 list에 여러개가 담기는데.. 하나만 딸랑 가져올거야
		List<String> subArr = cosdao.getSubject();
	 
		ModelAndView mav=new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("comp",comp);
		mav.addObject("pageInfo",pageInfo);
		mav.addObject("totalCount",totalCount);
		mav.addObject("subArr",subArr);
		mav.addObject("cosubject",cosubject);
		mav.setViewName(getPage);
		return mav;
	
	}
}
