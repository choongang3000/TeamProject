package boardt.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boardt.model.BTBean;
import boardt.model.BTDao;
import utility.COSListPaging;

@Controller
public class BTListController {

	@Autowired
	private BTDao btdao;
	
	//.bd요청
	private final String command="/list.bt";
	private String getPage="btlist";
	
	@RequestMapping(value=command)
	public ModelAndView doAction(
			@RequestParam(value="pageNumber",required=false) String pageNumber,
			@RequestParam(value="subject",required=false) String subject,
			HttpServletRequest request,
			BTBean btbean,BindingResult result){
			System.out.println("요기~~>>" + subject);
			
			//만약 여러개를 선택해서 값들이 ,로 연결되어있다면 btbean.getSubject().split(",") 이 값을 String[] (받을변수 이름) 으로 배열로 받아서 쓸 수도 있어
			//contains 함수를 쓰면 중간에 ,가 끼어있어도 찾아내서 포함되어있다고 알 수 있어
			//null 또는 "" 공백이 넘어오는 것은 전체조회로 설정 필요
			Map<String, String> map = new HashMap<String, String>();
			map.put("subject",btbean.getSubject());
			
			String url;
	         if(subject != null) {
	            String[] subArr = subject.split(","); //split함수는 나눌려는 문자열에 해당 문자가 없으면 그냥 배열 1개짜리 값을 줌
	            //subArr 객체에 subject 그대로 들어감
	   
	            url = request.getContextPath() + command + "?subject=" + subArr[0];
	            for(int i=0; i<subArr.length-1; i++) {
	               url += "&subject=" + subArr[i+1];
	            }
	         }
	         else {            
	            url = request.getContextPath() + command; // ex//list.bd
	         }
	         
			
			COSListPaging pageInfo = new COSListPaging(pageNumber,null,totalCount,url,null,null);//체크박스로 시도
			List<BTBean> BTList = btdao.getBoardList(pageInfo,map);
			
		
			ModelAndView mav = new ModelAndView();
//★★		List<BTBean> BTList = btdao.getBoardList(pageInfo);
			//List<BTBean> BTList = btdao.getBoardList(pageInfo,map);//키워드 검색할 때 시도 - 내가 찾으려는 검색 단어가 map에 들어가 있으니까 map도 담고..
			List<String> sub = btdao.getSubList();//과목 조회
			List<BTBean> answer = btdao.getAnswer();
			mav.addObject("BTList", BTList);
			mav.addObject("totalCount", totalCount);
			mav.addObject("pageInfo", pageInfo);
			mav.addObject("Subjects", sub);
			mav.addObject("Answer", answer);
			mav.addObject("subject", subject);
			
			mav.setViewName(getPage); 
			
			return mav; // /WEB-INF/board/list.jsp
	}
	
	
}
