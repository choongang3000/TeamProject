package boardt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import boardt.model.BTDao;

@Controller
public class BTDeleteController {
	
	@Autowired
	private BTDao btdao;
	
	//.bt��û
	private final String command = "delete.bt";
	private String gotoPage = "redirect:/list.bt";
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(
			@RequestParam(value="num",required=true)String num,  
			@RequestParam(value="pageNumber",required=true)String pageNumber,
			Model model){
		
		int cnt = btdao.btdelete(num);
		if(cnt>0) {
			System.out.println("���ڵ� ���� ����");
		}
		else {
			System.out.println("���ڵ� ���� ����");
		}
		
		return gotoPage+"?pageNumber="+pageNumber;
	}
}
