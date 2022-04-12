package boarda.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import boarda.model.BADao;

@Controller
public class BADeleteController {
	private final String command = "delete.ba";
	private String getPage = "redirect:/list.ba";

	@Inject
	private BADao badao;

	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(
			@RequestParam(value="banum", required=true) int banum,
			@RequestParam(value="pageNumber", required=true) int pageNumber,
			HttpServletRequest request) {

		int cnt = badao.deleteBA(banum);
		return getPage+"?pageNumber="+pageNumber;
	}
}

