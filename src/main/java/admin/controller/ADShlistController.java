package admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import student.model.STUOrderBean;
import student.model.STUOrderBindBean;
import student.model.STUOrderDao;
import student.model.STUOrderDeBean;
import student.model.STUOrderDeDao;
import utility.Paging;

@Controller
public class ADShlistController {
	
	private final String command = "shlist.ad";
	private String getPage = "adshlist";
	
//	@Autowired(required=true)
	@Autowired
	private STUOrderDao odao;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doAction(HttpServletRequest request,
							@RequestParam(value="keyword", required=false) String keyword,
							@RequestParam(value="pageNumber", required=false) String pageNumber) {
		
		Map<String,String> map = new HashMap<String,String>();
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
		
		
		int totalcount = odao.getOrderCount(map);
		String url = request.getContextPath() + "/" + command;
		
		Paging pageInfo = new Paging(pageNumber, "10", totalcount, url, null, keyword);
		
		List<STUOrderBean> list = odao.orderAll(map,pageInfo);
		
		request.setAttribute("totalcount", totalcount);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("list", list);
		
		return getPage;
	}

}
