package teacher.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import teachers.model.TEBean;
import teachers.model.TEDao;

@Controller
public class TCListController { //¡Ú¡Ú 
	
	@Autowired
	private TEDao tedao;
	
	private final String command = "list.tc";
	private String getPage = "tchome";
	
	@RequestMapping(value=command)
	public ModelAndView doAction(
			HttpServletRequest request) {
		
		List<TEBean> list = tedao.getTEList();
		ModelAndView mav=new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName(getPage);
		return mav;
		
	}
}
