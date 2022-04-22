package course.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import course.model.COSBean;
import course.model.COSDao;

@Controller
public class COSDetailViewController {
	private final String command="/detail.cos";
	private String getPage="cosDetail";
	
	@Autowired
	private COSDao cosdao;
	
	@RequestMapping(value = command ,method = RequestMethod.GET)
	public String doAction(
			@RequestParam(value = "conum",required = true) int conum,
			@RequestParam(value = "pageNumber",required = false) String pageNumber,
			Model model) {
		
		COSBean bean = cosdao.getCOS(conum);
		model.addAttribute("bean", bean);
		model.addAttribute("pageNumber", pageNumber);
		return getPage;
	}

}
