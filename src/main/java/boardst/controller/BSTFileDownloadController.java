package boardst.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BSTFileDownloadController {
	
	private final String command = "fileDownLoad.bst";
	
	@Autowired
	ServletContext servletContext; 
	
	@RequestMapping(value=command)
	public void doAction(@RequestParam(value="FileName", required=true) String FileName,
							HttpServletRequest request,
							HttpServletResponse response) {
		
		try {
//			response.setContentType("text/html;charset=UTF-8");
			
			String uploadPath = servletContext.getRealPath("/resources");
			String path = uploadPath + "\\" + FileName;
			System.out.println(path);
			//C:\Spring_workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\TeamProject_3000\resources\파일이름
			
//			String header = request.getHeader("User-Agent");
//			if(header.contains("Chrome")) {} 사용 브라우저가 크롬일 경우
			
			String FileName_enc = new String(FileName.getBytes("UTF-8"),"ISO-8859-1");// 한글깨짐 처리
//			if(FileName.equals(FileName_enc) == false) {
//				System.out.println(FileName);
//				System.out.println(FileName_enc);
//				System.out.println("문제 생김");
//				PrintWriter out = response.getWriter();
//				out.print("<script>alert('파일 이름 오류 발생.  파일이름을 적절히 설정해 주세요')</script>");
//				return;
//			}
			
			response.setHeader("Content-Disposition", "attachment;filename=" + FileName_enc.substring(37,FileName_enc.length())); // 다운로드 되거나 로컬에 저장되는 용도로 쓰이는지를 알려주는 헤더
	    	
	    	FileInputStream fileInputStream = new FileInputStream(path);
			OutputStream out = response.getOutputStream();
	    	
	    	int read = 0;
	        byte[] buffer = new byte[1024];
	        while ((read = fileInputStream.read(buffer)) != -1) { // 1024바이트씩 계속 읽으면서 outputStream에 저장, -1이 나오면 더이상 읽을 파일이 없음
	                out.write(buffer, 0, read);
	        }//while
		} catch (Exception e) {
			e.printStackTrace();
		} // 파일 읽어오기 
		
	}
}
