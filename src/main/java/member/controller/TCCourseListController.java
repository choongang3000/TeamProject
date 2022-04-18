package member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import course.model.COSBean;
import member.model.MemberBean;
import member.model.MemberDao;
import utility.Paging;

@Controller
public class TCCourseListController {
	
	private final String command = "tcCourseList.mem";
	private String getPage = "tcCourseList";
	
	@Autowired
	private MemberDao mdao;
	
	@RequestMapping(command)
	public String doAction(@RequestParam(value="pageNumber",required = false) String pageNumber,
					       @RequestParam(value="whatColumn",required = false) String whatColumn,
						   @RequestParam(value="keyword",required = false) String keyword,
						   HttpSession session,
						   HttpServletRequest request) {
		
		String url = request.getContextPath() +"/"+command;
		
		MemberBean teacher = (MemberBean)session.getAttribute("loginInfo");
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("coteacher", teacher.getAname());
		
		System.out.println("keyword >>" + keyword);
		if(whatColumn == null) {
			map.put("whatColumn", null);
		}
		else {
			if(whatColumn.equals("") || keyword.equals("null")) {
				map.put("whatColumn", null);
			}
			else {
				map.put("whatColumn", whatColumn);							
			}
		}
		
		if(keyword == null) {
			map.put("keyword", null);
		}
		else {
			if(keyword.equals("") || keyword.equals("null")) {
				map.put("keyword", null);
			}
			else {				
				map.put("keyword", "%"+keyword+"%");			
			}
		}
		
		
		int totalcount = mdao.getCourseCount(map);
		System.out.println("ÀüÃ¼ °¹¼ö : " + totalcount);
		
		Paging pageInfo = new Paging(pageNumber, "5", totalcount, url, whatColumn, keyword);
		
		List<COSBean> cosArr = mdao.getAllCourse(map, pageInfo);
		
		List<String> subArr = mdao.getSubject();
		
		request.setAttribute("subArr", subArr);
		request.setAttribute("cosArr", cosArr);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("pageNumber", pageNumber);
		request.setAttribute("whatColumn",whatColumn);
		request.setAttribute("keyword",keyword);
		
		return getPage;
	}
	
}
