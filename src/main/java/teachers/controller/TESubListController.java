package teachers.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import course.model.COSBean;
import course.model.COSDao;
import teachers.model.TEBean;
import teachers.model.TEDao;
import utility.Paging;


@Controller
public class TESubListController {//4/14 JH - teacherlist.jsp 강의 보러가기 버튼 -> sublist.te 요청 -> teachersublist.jsp 이동

/*
 	@Autowired
	private TEDao tedao;
	
	private final String command = "/sublist.te";
	private String getPage = "teachersublist";

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(
			@RequestParam(value = "tnum", required = true) String tnum,
			@RequestParam(value = "tname", required = true) String tname,
			Model model) {
	
			TEBean bean = tedao.getTEList(tnum);
			model.addAttribute("bean", bean);

			return getPage;
	}
*/

	private final String command = "/sublist.te";
	private String getPage = "teachersublist";
	
	@Autowired
	private TEDao tedao;

	@RequestMapping(value=command)
	public ModelAndView doAction( /* 상단 선생님 탭(teacherlist.jsp)에서 버튼 누르면 tname 넘김 */
			//@RequestParam(value = "tname", required = true) String tname,
			TEBean tbean, BindingResult result) {
			//HttpServletRequest request) {
		
		List<TEBean> list = tedao.getTESubList(tbean); /* TEDao -> teachers.xml */
		
		TEBean comp = list.get(0);
		
		
		/*
		모든 강의를 가져왔을 때 하나의 선생님 이름, 이미지, 컨텐츠로 Array를 만듦.
		List<TEBean> re_list = new ArrayList<TEBean>(); // 빈 새로 만들어줌 
		for(TEBean comp : list) { // 기존에 TEBean에 comp로 하나씩 갖고왕 
			
			TEBean re_comp = new TEBean(); // 중복되지 않는 걸 담을 TEBean(빈 공간)을 만듦 
			
			boolean flag = false;
			
			for(int i=0; i<re_list.size(); i++) {
				if(re_list.get(i).getCoteacher().equals(comp.getCoteacher())) {
					flag = true;
				}
			}
			
			if(flag == false) {
				re_comp.setCoteacher(comp.getCoteacher());
				re_comp.setCoimage(comp.getCoimage());
				re_comp.setCocontent(comp.getCocontent());
				
				re_list.add(re_comp); // flag가 false일 때 add추가함 
			}
		}
		*/
		//String tname = tbean.getTname();
		//TEBean tebean = tedao.getTESubOne(tname);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("comp",comp);
//		mav.addObject("re_list",re_list);
		//mav.addObject("coimage",coimage);
		//mav.addObject("tebean",tebean);
		mav.setViewName(getPage);
		return mav;
	
	}
}
