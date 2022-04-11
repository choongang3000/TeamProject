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
		if(session.getAttribute("loginInfo") == null) {// �α��� ��������
			session.setAttribute("destination", "�α��� �ϰ� ���ƿ� ��ġ�� url");
			return "�α��� �� ��ġ�� ���� url";
		}
		else {
			ArrayList<Integer> mycart = (ArrayList<Integer>)session.getAttribute("mycart");
			
			if(mycart == null) {
				mycart = new ArrayList<Integer>();
			}
			
			if(!mycart.contains(cobean.getConum())) {//īƮ�� ��ٱ��Ͽ� ��⸦ �������� ���� ��ٱ��Ͽ� �ش� ���ǰ� ���ٸ� ���� num�� ����
				mycart.add(cobean.getConum()); 	
			}
			
			session.setAttribute("mycart", mycart);

			return gotoPage;
		}
		
	}
	
	
}
