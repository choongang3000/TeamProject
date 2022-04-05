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
			//C:\Spring_workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\TeamProject_3000\resources\�����̸�
			
//			String header = request.getHeader("User-Agent");
//			if(header.contains("Chrome")) {} ��� �������� ũ���� ���
			
			String FileName_enc = new String(FileName.getBytes("UTF-8"),"ISO-8859-1");// �ѱ۱��� ó��
//			if(FileName.equals(FileName_enc) == false) {
//				System.out.println(FileName);
//				System.out.println(FileName_enc);
//				System.out.println("���� ����");
//				PrintWriter out = response.getWriter();
//				out.print("<script>alert('���� �̸� ���� �߻�.  �����̸��� ������ ������ �ּ���')</script>");
//				return;
//			}
			
			response.setHeader("Content-Disposition", "attachment;filename=" + FileName_enc.substring(37,FileName_enc.length())); // �ٿ�ε� �ǰų� ���ÿ� ����Ǵ� �뵵�� ���̴����� �˷��ִ� ���
	    	
	    	FileInputStream fileInputStream = new FileInputStream(path);
			OutputStream out = response.getOutputStream();
	    	
	    	int read = 0;
	        byte[] buffer = new byte[1024];
	        while ((read = fileInputStream.read(buffer)) != -1) { // 1024����Ʈ�� ��� �����鼭 outputStream�� ����, -1�� ������ ���̻� ���� ������ ����
	                out.write(buffer, 0, read);
	        }//while
		} catch (Exception e) {
			e.printStackTrace();
		} // ���� �о���� 
		
	}
}
