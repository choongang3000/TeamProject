package admin.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import student.model.STUOrderBean;
import student.model.STUOrderBindBean;
import student.model.STUOrderDao;
import student.model.STUOrderDeBean;
import student.model.STUOrderDeDao;

@Controller
public class ADShlistController {
	
	private final String command = "shlist.ad";
	private String getPage = "adshlist";
	private String gotoPage = "redirect:/adshlist";
	
//	@Autowired(required=true)
	@Autowired
	private STUOrderDao odao;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doAction(HttpServletRequest request) {
		
		List<STUOrderBean> list = new ArrayList<STUOrderBean>();
		list = odao.orderAll();
		
		request.setAttribute("list", list);
		return getPage;
	}
	
	
	 @RequestMapping(value=command,method=RequestMethod.POST)
	 public String doAction(@RequestParam(value="aid", required=true) String aidpost, HttpServletRequest request) {

			List<STUOrderBean> list = new ArrayList<STUOrderBean>();
			list = odao.orderList(aidpost);
			
			request.setAttribute("list", list);
			
			return getPage;
	 }

}
