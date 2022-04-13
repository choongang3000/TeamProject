package admin.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.CoDao;

@Controller
public class ADCoDeleteController {

	private final String command = "codelete.ad";
	private String getPage = "redirect:/colist.ad";
	
	@Inject
	private CoDao codao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(@RequestParam(value="conum", required=true) String conum) {
		
		int cnt = codao.deleteCourses(conum);

		return getPage;
	}
}
