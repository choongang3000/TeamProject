package course.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.Session;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import course.model.COSBean;
import course.model.COSDao;
import course.model.CoDao2;
import utility.COSListPaging;

@Controller
public class ADCoDeleteController2 {

	private final String command = "codelete.cos";
	
	@Inject
	@Qualifier("myCoDao2")
	private CoDao2 codao;

	@Inject
	@Qualifier("COSDao")
	private COSDao cosdao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(
			@RequestParam(value="whatColumn",required = false) String whatColumn,
			@RequestParam(value="keyword", required=false) String keyword,
			@RequestParam(value="pageNumber", required=true) String pageNumber,
			@RequestParam(value="cosubject", required=false) String cosubject,
			@RequestParam(value="conum", required=true) String conum,
			HttpServletRequest request,  HttpSession session) {
		
		int cnt = codao.deleteCourses(conum);
		/*
		Map<String, String> map=new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		int totalCount=cosdao.totalCount(map);
		String url ;
		if(cosubject != null) {
			url = request.getContextPath()+command+"?cosubject="+cosubject;
		}
		else {
			url = request.getContextPath()+command;
		}
		COSListPaging pageInfo=new COSListPaging(pageNumber, null, totalCount, url, whatColumn, keyword);
		List<COSBean> list = cosdao.getCOSList(pageInfo, map);
		*/
		session.setAttribute("keyword_fromdel", keyword);
		return "redirect:/list.cos?pageNumber=" + pageNumber + "&cosubject=" + cosubject + "&whatColumn=" + whatColumn; 
		}
}