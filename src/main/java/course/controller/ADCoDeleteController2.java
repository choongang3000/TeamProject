package course.controller;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import course.model.CoDao2;

@Controller
public class ADCoDeleteController2 {

	private final String command = "codelete.cos";
	private String getPage = "redirect:/list.cos";
	
	@Inject
	@Qualifier("myCoDao2")
	private CoDao2 codao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(
			@RequestParam(value="pageNumber", required=true) String pageNumber,
			@RequestParam(value="conum", required=true) String conum) {
		
		int cnt = codao.deleteCourses(conum);

		return getPage;
	}
}