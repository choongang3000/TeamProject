package admin.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import admin.model.SubBean;
import admin.model.SubDao;

@Controller
public class ADSubListController {

	private final String command = "sublist.ad";
	private String getPage = "sublist";
	//private String gotoPage = "";
	
	@Inject
	private SubDao subdao;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doAction1(HttpServletRequest request) { //Á¶È¸
		List<SubBean> sublist = subdao.subjectAll();
		request.setAttribute("sublist", sublist);
		return getPage;
	}
	
//	@RequestMapping(value=command,method=RequestMethod.POST)
//	public String doAction2() {
//		return getPage;
//	}
}
