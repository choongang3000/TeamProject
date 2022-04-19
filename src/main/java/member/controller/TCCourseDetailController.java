package member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import course.model.COSBean;
import member.model.MemberDao;

@Controller
public class TCCourseDetailController {
	
	private final String command = "tcCourseDetail.mem"; 
	private String getPage = "tcCourseDetail";
	
	@Autowired
	private MemberDao mdao;
	
	@RequestMapping(command)
	public String doAction(@RequestParam(value="conum", required=true) int conum,
							@RequestParam(value="pageNumber", required=false) String pageNumber,
							@RequestParam(value="whatColumn", required=false) String whatColumn,
							@RequestParam(value="keyword", required=false) String keyword,
							HttpServletRequest request) {
		
		COSBean course = mdao.getCourseByConum(conum);
		
		request.setAttribute("course", course);
		request.setAttribute("pageNumber", pageNumber);
		request.setAttribute("whatColumn", whatColumn);
		request.setAttribute("keyword", keyword);
		
		return getPage;
	}
}
