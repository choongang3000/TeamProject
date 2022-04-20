package member.controller;

import java.util.ArrayList;
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

@Controller
public class STUCourseListController {

	private final String command = "stucolist.mem";
	private String getPage = "stuCourseList";
	
	@Autowired
	private MemberDao mdao;
	
	@RequestMapping(command)
	public String doAction(HttpSession session,
							HttpServletRequest request,
							@RequestParam(value="pageNumber", required=false) String pageNumber,
							@RequestParam(value="whatColumn", required=false) String whatColumn,
							@RequestParam(value="keyword", required=false) String keyword) {
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		String aid = loginInfo.getId();
		
		Map<String,String> map = new HashMap<String, String>();
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
		
		
		List<Integer> onumArr = mdao.getAllConum(aid);
		
		ArrayList<COSBean> cosArr = new ArrayList<COSBean>();
		if(onumArr.size() != 0) {
			for(Integer conum : onumArr) {
				COSBean cobean = mdao.getCourseByConum(conum);
				
				cosArr.add(cobean);
			}
		}
		
		
		request.setAttribute("cosArr", cosArr);
		
		return getPage;
	}
}
