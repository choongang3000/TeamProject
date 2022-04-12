package boarda.controller;

import java.io.File;
import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boarda.model.BABean;
import boarda.model.BADao;

@Controller
public class BAInsertController {
	private final String command = "insert.ba";
	private final String getPage = "insertForm";
	private String gotoPage="redirect:/list.ba";

	@Inject
	private BADao baDao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doAction() {
		return getPage;
	}

	@RequestMapping(value=command,method=RequestMethod.POST)
	public ModelAndView doAction(@Valid BABean bean, BindingResult result, HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		
		String uploadPath = servletContext.getRealPath("/resources");
		MultipartFile multi = bean.getUpload();
		
		if(result.hasErrors()) {
			mav.setViewName(getPage);
			return mav;
		}
		

		int cnt = baDao.insertBA(bean);
		System.out.println("cnt:"+cnt);
		if(cnt>0) {
			File f = new File(uploadPath+"\\"+bean.getBaimage());
			
			try {
				multi.transferTo(f);
			}catch(IllegalStateException e){
				System.out.println("이미지 삽입 오류1");
			}catch(IOException e) {
				System.out.println("이미지 삽입 오류2");
			}
			mav.setViewName(gotoPage);
		}
		else {
			mav.setViewName(gotoPage);
		}
		
		return mav;
	}
}