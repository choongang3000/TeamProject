package board.CsController;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import board.Csmodel.boardCsBean;
import board.Csmodel.boardCsDao;
import member.model.MemberBean;

@Controller
public class BCsInsertController {
	
	private final String command = "insert.bod";
	private String getPage = "writeForm";
	private String gotoPage = "redirect:/list.bod";
	
	@Autowired
	private boardCsDao csdao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction1() {
		
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String doAction(boardCsBean bb, HttpServletRequest request,HttpSession session) {
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		Timestamp reg_date = new Timestamp(System.currentTimeMillis());
		
		bb.setReg_date(reg_date);
		
		//String ip = request.getRemoteAddr();
		//bb.setIp(ip);
		
		int cnt = csdao.insertArticle(bb);
		if(cnt>0) {
			return gotoPage;
		}
		else {
			return getPage;
		}
	}
			
}