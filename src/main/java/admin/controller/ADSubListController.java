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

	@Inject
	private SubDao subdao;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doAction(HttpServletRequest request) {
		List<SubBean> sublist = subdao.subjectAll();
		request.setAttribute("sublist", sublist);
		
		return getPage;
	}
	
}
