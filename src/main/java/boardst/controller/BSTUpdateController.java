package boardst.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boardst.model.BSTBean;
import boardst.model.BSTDao;

@Controller
public class BSTUpdateController {
	
	private final String command = "update.bst";
	private String getPage = "boardst_updateForm";
	private String beforeFile;
	
	@Autowired
	private BSTDao bstdao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public ModelAndView doAction(@RequestParam(value="num", required=true) int num,
							@RequestParam(value="pageNumber", required=true) String pageNumber) {
		
		BSTBean board = bstdao.getBoardByNum(num);
		
		beforeFile = board.getImage();
		List<String> subjectArr = bstdao.getSubjectArr();
		List<String> teacherArr = bstdao.getTeacherArr();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("subjectArr", subjectArr);
		mav.addObject("teacherArr", teacherArr);
		mav.addObject("board",board);
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName(getPage);
		
		return mav;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView doAction(@RequestParam(value="pageNumber", required=true) String pageNumber,
									BSTBean bstbean) {
		
		ModelAndView mav = new ModelAndView();
		
		String uploadPath = servletContext.getRealPath("/resources");

		if( !bstbean.getImage().equals("") ) {
			MultipartFile multi = bstbean.getUpload();
		
			if(beforeFile != null) {
				File dir = new File(uploadPath,beforeFile);
			
				if(dir.exists()) {
					dir.delete();
				}
			}
			
			
			UUID uuid = UUID.randomUUID();
			String fileName = uuid + "-" + multi.getOriginalFilename();
			
			bstbean.setImage(fileName);
			
			int cnt = bstdao.updateBoard(bstbean);
			
			
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
			
			mav.setViewName("redirect:/detail.bst?num="+bstbean.getNum()+"&pageNumber="+pageNumber);
		}
		else {
			bstbean.setImage(beforeFile);
			bstdao.updateBoard(bstbean);
			mav.setViewName("redirect:/detail.bst?num="+bstbean.getNum()+"&pageNumber="+pageNumber);
		}
		
		return mav;
	}
	
	
}
