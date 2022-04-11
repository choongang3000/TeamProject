package admin.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.SubDao;

@Controller
public class ADSubDeleteController {
	private final String command = "subdelete.ad";
	private String getPage = "redirect:/sublist.ad";
	
	@Inject
	private SubDao subdao;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doAction(@RequestParam(value="subnum", required=true) String subnum) {
		subdao.deleteSubject(subnum);
		
		return getPage;
	}
}
