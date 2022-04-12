package student.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.CoBean;

@Controller
public class STUAddCartController {
	
	private final String command = "addcart.stu";
	private String gotoPage = "redirect:/cartlist.stu";
	
	@RequestMapping(command)
	public String doAction(HttpSession session,
							@RequestParam(value="conum", required=false) String conum) {
		
	
		if(session.getAttribute("loginInfo") == null) {// 로그인 안했으면
			session.setAttribute("destination", "로그인 하고 돌아올 위치의 url");
			return "로그인 폼 위치로 가는 url";
		}
		else {
			
			ArrayList<Integer> mycart = (ArrayList<Integer>)session.getAttribute("mycart");
			
			if(mycart == null) {
				mycart = new ArrayList<Integer>();
			}
			
			if(conum != null) {
				if(!mycart.contains(Integer.parseInt(conum))) {//카트에 장바구니에 담기를 눌렀을때 만약 장바구니에 해당 강의가 없다면 강의 num을 담음
					mycart.add(Integer.parseInt(conum)); 	
				}
			}
			session.setAttribute("mycart", mycart);

			return gotoPage;
		}
		
	}
	
	
}
