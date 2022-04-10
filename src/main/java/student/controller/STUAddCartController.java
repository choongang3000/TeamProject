package student.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;

import admin.model.CoBean;

public class STUAddCartController {
	
	private final String command = "addcart.stu";
	private String gotoPage = "redirect:/cartlist.stu";
	
	@RequestMapping(command)
	public String doAction(HttpSession session,
							CoBean cobean) {
		if(session.getAttribute("loginInfo") == null) {// 로그인 안했으면
			session.setAttribute("destination", "로그인 하고 돌아올 위치의 url");
			return "로그인 폼 위치로 가는 url";
		}
		else {
			ArrayList<Integer> mycart = (ArrayList<Integer>)session.getAttribute("mycart");
			
			if(mycart == null) {
				mycart = new ArrayList<Integer>();
			}
			
			if(!mycart.contains(cobean.getConum())) {//카트에 장바구니에 담기를 눌렀을때 만약 장바구니에 해당 강의가 없다면 강의 num을 담음
				mycart.add(cobean.getConum()); 	
			}
			
			session.setAttribute("mycart", mycart);

			return gotoPage;
		}
		
	}
	
	
}
