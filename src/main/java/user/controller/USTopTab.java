package user.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import admin.model.SubBean;
import admin.model.SubDao;

@Controller
public class USTopTab {

	
	/*
	 * <<<<이건 안쓰는데 삭제 보류>>>>
	 * 
	 * //@Autowired //private SubDao subdao;
	 * 
	 * //ushome -> 상단 강의 탭 눌렀을 때 subject.us 요청 -> ussubject-main.jsp로 이동 private
	 * final String command1 = "subject-main.us"; 사용자 화면 - 강의 - 메인 private String
	 * getPage1 = "ussubject-main";
	 * 
	 * @RequestMapping(value=command1,method=RequestMethod.GET) public String
	 * doAction1(HttpServletRequest request) { //List<SubBean> sublist =
	 * subdao.subjectAll(); //request.setAttribute("sublist", sublist); return
	 * getPage1; }
	 * 
	 * private final String command2 = "teacher.us"; private String getPage2 =
	 * "usteacher";
	 * 
	 * @RequestMapping(value=command2,method=RequestMethod.GET) public String
	 * doAction2(HttpServletRequest request) {
	 * 
	 * return getPage2; }
	 * 
	 * private final String command3 = "subject-main-java.us"; 사용자 화면 - 강의 - JAVA
	 * private String getPage3 = "ussubject-java";
	 * 
	 * @RequestMapping(value=command3,method=RequestMethod.GET) public String
	 * doAction3(HttpServletRequest request) { //List<SubBean> sublist =
	 * subdao.subjectAll(); //request.setAttribute("sublist", sublist); return
	 * getPage3; }
	 * 
	 * private final String command4 = "subject-main-mypage.us"; 사용자 화면 - 마이페이지
	 * private String getPage4 = "usmypage";
	 * 
	 * @RequestMapping(value=command4,method=RequestMethod.GET) public String
	 * doAction4(HttpServletRequest request) { //List<SubBean> sublist =
	 * subdao.subjectAll(); //request.setAttribute("sublist", sublist); return
	 * getPage4;
	 * 
	 * 
	 * 
	 * }
	 */
}
