package boarda.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boarda.model.BABean;
import boarda.model.BADao;

@Controller
public class BAUpdateController {
	
	private final String command = "update.ba";
	private String getPage = "updateForm";
	private String gotoPage = "redirect:/list.ba";
	private BABean babean;
	private String beforeFile;
	
	@Autowired
	private BADao baDao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doAction(
							@RequestParam(value="banum", required=true) String banum,
							Model model) {
		
		babean = baDao.getBA(banum);
		
		model.addAttribute("babean", babean);

		return getPage;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public ModelAndView doAction(@Valid @ModelAttribute ("babean") BABean babean,
								BindingResult result,
								HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		String uploadPath = servletContext.getRealPath("/resources");

		if( !babean.getBaimage().equals("") ) {
			MultipartFile multi = babean.getUpload();
		
			if(beforeFile != null) {
				File dir = new File(uploadPath,beforeFile);
			
				if(dir.exists()) {
					dir.delete();
				}
			}
			
			
			UUID uuid = UUID.randomUUID();
			String fileName = uuid + "-" + multi.getOriginalFilename();
			
			babean.setBaimage(fileName);
			
			int cnt = baDao.updateBA(babean);
			
			
			if(cnt>0) {
				File f = new File(uploadPath,fileName);
				try {
					multi.transferTo(f);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
			mav.setViewName(gotoPage);
		}
		else {
			babean.setBaimage(beforeFile);
			baDao.updateBA(babean);
			mav.setViewName(gotoPage);
		}
		
		return mav;
	}
	
	
}
