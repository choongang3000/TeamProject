package teacher.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import teacher.model.TeacherBean;
import teacher.model.TeacherDao;
import utility.Paging;

@Controller
public class TCListController {
	private final String command = "list.tc";
	private String getPage = "tchome";
	
	@Autowired
	private TeacherDao tdao;
	
	@RequestMapping(value=command)
	public String doAction(@RequestParam(value="whatColumn", required= false) String whatColumn,
							@RequestParam(value="ascdesc", required= false) String ascdesc,
							@RequestParam(value="keyword", required= false) String keyword,
							HttpServletRequest request) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("ascdesc", ascdesc);
		map.put("keyword", "%"+keyword+"%");
		
		int totalcount = tdao.getTeacherCount(map);
		
		List<TeacherBean> TeacherArr = tdao.getAllTeacher(map);
		
		request.setAttribute("TeacherArr", TeacherArr);
		request.setAttribute("totalcount", totalcount);
		
		return getPage;
	}
}
