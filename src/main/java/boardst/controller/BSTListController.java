package boardst.controller;
	
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boardst.model.BSTBean;
import boardst.model.BSTDao;
import member.model.MemberBean;
import utility.Paging;
	
@Controller
public class BSTListController {
	
	private final String command = "list.bst";
	private String getPage = "boardst_list";
	
	@Autowired
	private BSTDao bstdao;
	
	@RequestMapping(value=command)
	public String doAction(@RequestParam(value="whatColumn", required= false) String whatColumn,
							@RequestParam(value="keyword", required= false) String keyword,
							@RequestParam(value="pageNumber", required= false) String pageNumber,
							HttpServletRequest request,
							HttpSession session) {
		
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		map.put("type",loginInfo.getType());
		map.put("stuId",loginInfo.getId());
		map.put("teacherName",loginInfo.getAname());
		
		String url = request.getContextPath() + "/" + command;
		
		int totalCount = bstdao.getTotalCount(map);
		
		Paging pageInfo = new Paging(pageNumber, "10", totalCount, url, whatColumn, keyword);
		
		List<BSTBean> boardArr = bstdao.getAllBoard(pageInfo, map); 
		
		request.setAttribute("boardArr", boardArr);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("totalCount", totalCount);
		
		return getPage;
	}
	
}
