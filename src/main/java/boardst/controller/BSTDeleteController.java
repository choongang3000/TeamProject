package boardst.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boardst.model.BSTBean;
import boardst.model.BSTDao;

@Controller
public class BSTDeleteController {

	private final String command = "delete.bst";
	private String gotoPage = "redirect:/list.bst";
	
	@Autowired
	private BSTDao bstdao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command)
	public String doAction(@RequestParam(value="num", required=true) int num,
							@RequestParam(value="pageNumber", required=true) String pageNumber,
							HttpServletRequest request,
							HttpServletResponse response) {
		
		String uploadPath = servletContext.getRealPath("/resources");
		
		response.setContentType("text/html;charset=UTF-8");
		
		BSTBean bstbean =bstdao.getBoardByNum(num);
		
		if(bstbean.getImage() != null) {
			if(!bstbean.getImage().equals("")) {
				File dir = new File(uploadPath,bstbean.getImage());
				
				if(dir.exists()) {
					dir.delete();
				}
			}
		}
		int cnt = bstdao.deleteBoard(num);
		
		if(cnt>0) {
			return gotoPage + "?pageNumber=" + pageNumber;			
		}
		else {
			try {
				PrintWriter out = response.getWriter();
				out.print("<script>alert('오류 발생. 삭제 실패')</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			return gotoPage + "?pageNumber=" + pageNumber;	
		}
		
	}
	
	
}
