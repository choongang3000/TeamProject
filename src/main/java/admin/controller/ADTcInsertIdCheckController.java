package admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.TeacherDao;

@Controller
public class ADTcInsertIdCheckController {

	private final String command = "check_id.ad";
	
	@Autowired
	private TeacherDao tdao;
	
	@RequestMapping(command)
	public void doAction(@RequestParam(value="input_id", required=true) String input_id,
							HttpServletResponse response) {
		
		try {
			boolean result = tdao.check_id(input_id);
			
			PrintWriter out;
				out = response.getWriter();
			
			if(result == true){
				out.print("impossible");
			}
			else{
				out.print("possible");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
