package course.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import course.model.COSBean;
import course.model.COSDao;

@Controller
public class COSShowController {

	private final String command = "show.cos";
	private String getPage = "cosShow";
	
	@Autowired
	private COSDao codao;
	
	@RequestMapping(command)
	public String doAction(@RequestParam(value="conum", required=true) int conum,
							HttpServletRequest request) {
		
		COSBean course = codao.getCOS(conum);
		
		request.setAttribute("course", course);
		
		return getPage;
	}
}
