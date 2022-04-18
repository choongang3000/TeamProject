package on.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boarda.model.BABean;
import boarda.model.BADao;
import course.controller.COSListController;
import course.model.COSBean;
import course.model.COSDao;
import member.model.MemberBean;
import teachers.controller.TEListController;
import teachers.model.TEBean;
import teachers.model.TEDao;
import utility.COSListPaging;
import utility.Paging;

@Controller
public class MainCotroller {
   
   private final String command1="/home.us"; //★JH : main.on -> home.us로 변경
   private String getPage1 = "ushome"; //★JH : main -> ushome로 변경

   @Autowired
   private TEDao tedao;
   
   @Autowired
   private COSDao cosdao;

  
   @RequestMapping(command1)
   public ModelAndView doAction(
		 @RequestParam(value="whatColumn", required=false) String whatColumn1,
		 @RequestParam(value="whatColumn", required=false) String whatColumn2,
         @RequestParam(value="keyword", required=false) String keyword1,
         @RequestParam(value="keyword", required=false) String keyword2,
         @RequestParam(value="pageNumber", required=false) String pageNumber1,
         @RequestParam(value="pageNumber", required=false) String pageNumber2,
         HttpServletRequest request,
         HttpSession session) {
      
	  MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo"); 
	   
      Map<String, String> map1=new HashMap<String, String>();
      Map<String, String> map2=new HashMap<String, String>();
      
      map1.put("whatColumn", whatColumn1);
      map2.put("whatColumn", whatColumn2);
      map1.put("keyword", "%"+keyword1+"%");
      map2.put("keyword", "%"+keyword2+"%");
      
      int totalCount1=tedao.totalCount(map1);
      int totalCount2=tedao.totalCount(map2);
      System.out.println("totalCount:"+totalCount1);
      System.out.println("totalCount:"+totalCount2);
      
      String url1=request.getContextPath()+command1;
      String url2=request.getContextPath()+command1;
      COSListPaging pageInfo1=new COSListPaging(pageNumber1, null, totalCount1, url1, whatColumn1, keyword1);
      COSListPaging pageInfo2=new COSListPaging(pageNumber2, null, totalCount2, url2, whatColumn2, keyword2);
      
        
      List<TEBean> teList = tedao.getTEList(pageInfo1, map1); 
      List<COSBean> cosList = cosdao.getCOSList(pageInfo2, map2);
    
      ModelAndView mav=new ModelAndView();
      mav.addObject("teList", teList);
      mav.addObject("cosList", cosList);
      mav.addObject("totalCount",totalCount1);
      mav.addObject("pageInfo",pageInfo1);
      mav.addObject("totalCount",totalCount2);
      mav.addObject("pageInfo",pageInfo2);
      mav.addObject("loginInfo",loginInfo);
      mav.setViewName(getPage1);
      
      return mav;
   
   }
   
  	private final String command2 = "bottom.us";
  	private String getPage2 = "uspolicy";

  	@RequestMapping(value=command2,method=RequestMethod.GET)
  	public String doAction2(HttpServletRequest request) {
  		
  		return getPage2;
  	
   }
  	
	private final String command3 = "/home.us";
  	private String getPage3 = "ushome";

  	@RequestMapping(value=command3,method=RequestMethod.GET)
  	public String doAction3(HttpServletRequest request) {
  		
  		return getPage3;
  	
   }

}