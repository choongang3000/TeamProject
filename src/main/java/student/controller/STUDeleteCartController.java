package student.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class STUDeleteCartController {

	private final String command = "deleteCart.stu";
	private String gotoPage = "redirect:/cartlist.stu";
	
	@RequestMapping(command)
	public String doAction(@RequestParam(value="conum", required=true) String conum,
							HttpSession session) {
		
		ArrayList<Integer> mycart = (ArrayList<Integer>)session.getAttribute("mycart");
		
		if(mycart.contains(Integer.parseInt(conum))) {
			int conum_index = mycart.indexOf(Integer.parseInt(conum));
			mycart.remove(conum_index);
		}
		
		return gotoPage;
	}
}
