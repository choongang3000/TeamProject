package admin.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.SubBean;
import admin.model.SubDao;

@Controller
public class ADSubUpdateController {
	private final String command = "subupdate.ad";
	private String getPage = "sublist";
	private String gotoPage = "redirect:/sublist.ad";
	
	@Inject
	private SubDao subdao;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doAction1(@RequestParam(value="subnum", required=true) String subnum,HttpServletRequest request) {
		SubBean subbean = subdao.selectSubject(subnum);
		request.setAttribute("subbean", subbean);
		
		List<SubBean> sublist = subdao.subjectAll();
		request.setAttribute("sublist", sublist);
		return getPage;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String doAction2(SubBean subbean) {
		
		subdao.updateSubject(subbean);
		return gotoPage;
	}
	
}
