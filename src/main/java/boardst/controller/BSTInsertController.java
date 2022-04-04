package boardst.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import boardst.model.BSTBean;
import boardst.model.BSTDao;

@Controller
public class BSTInsertController {

	private final String command = "insert.bst";
	private String getPage = "boardst_insertForm";
	private String gotoPage = "redirect:/list.bst";
	
	@Autowired
	private BSTDao bstdao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(@RequestParam(value="pageNumber") String pageNumber,
							HttpServletRequest request) {
		
		request.setAttribute("pageNumber", pageNumber);
		
		return getPage;
	}
	
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String doAction(BSTBean bstBean,
							HttpServletRequest request) {
		
		String uploadPath = servletContext.getRealPath("/resources");
		
		MultipartFile multi = bstBean.getUpload();
		
		UUID uuid = UUID.randomUUID();
		String fileName = uuid + "-" + multi.getOriginalFilename();
		
		bstBean.setImage(fileName); 
		
		int cnt = bstdao.insertBoard(bstBean);
		
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
		
		
		return gotoPage;
	}
	
}
