package boardt.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boardt.model.BTBean;
import boardt.model.BTDao;

@Controller
public class BTInsertController {

	@Autowired
	private BTDao btdao;
	
	@Autowired
	ServletContext servletContext; //이미지 업로드 - 웹서버 폴더에 접근하는 객체
	
	//.bt요청
	private final String command="insert.bt";
	private String getPage="btinsertform";
	private String gotoPage="redirect:/list.bt"; //list.bt get요청
	
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doAction(
			HttpSession session,
			HttpServletRequest request) {//폼 띄우는 요청 - GET방식
								 //실제 insert 작업 - POST방식 
		
		List<String> sub = btdao.getSubList();
		request.setAttribute("sub",sub);
		/*
			if(session.getAttribute("loginInfo") == null) { // 로그인 안한 상태//session으로 설정한 loginInfo가 없어서.. loginForm으로 이동.
				session.setAttribute("destination", "redirect:/insert.prd"); //destination에 insert.prd요청 세션으로 설정!!
				return "redirect:/loginForm.mem"; // MemberLoginController 
			}
			else {
				return getPage;
			}
		*/
		
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST) 
	 public ModelAndView doAction(
			 @Valid BTBean btbean, BindingResult result
			 ) {//MultipartFile file)throws IOException - 글쓰기, 수정하기 controller에 들어가야함
		 
		System.out.println("여기1");
		System.out.println("여기1 subject =>" + btbean.getSubject());
		System.out.println("여기1 subject =>" + btbean.getMovingimg());
		System.out.println("여기1 subject =>" + btbean.getQuizimg());
		System.out.println("여기1 subject =>" + btbean.getPasswd());
		System.out.println("여기1 subject =>" + btbean.getExamfile());
		
		 ModelAndView mav = new ModelAndView();
		 if(result.hasErrors()) {
			 List<String> sub = btdao.getSubList();
			 mav.addObject("sub",sub);
			 System.out.println("여기2");
			 mav.setViewName(getPage);
			 return mav;
		 }
		 System.out.println("여기3");
		 
		 //기본 경로에 original폴더 추가 필요
		 //C:\Spring_kjh\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\board_kjh\resources\original
		
		 MultipartFile multi1 = btbean.getUpload1();
		 MultipartFile multi2 = btbean.getUpload2();
		 MultipartFile multi3 = btbean.getUpload3();
		 UUID uuid = UUID.randomUUID();//랜덤으로 이름을 만들어줌
		 String fileName1 = uuid + "-" + multi1.getOriginalFilename();
		 String fileName2 = uuid + "-" + multi2.getOriginalFilename();
		 String fileName3 = uuid + "-" + multi3.getOriginalFilename();
		 String uploadPath = servletContext.getRealPath("/resources/images");//저장경로
		 btbean.setExamfile(fileName1);
		 btbean.setQuizimg(fileName2);
		 btbean.setMovingimg(fileName3);

		 
		 int cnt = btdao.btinsert(btbean); 
		 
		 if(cnt > 0) {//삽입 성공했으면
			 File saveFile1 = new File(uploadPath, fileName1); //변환된 파일 객체1-1
			 File saveFile2 = new File(uploadPath, fileName2); //변환된 파일 객체2-1
			 File saveFile3 = new File(uploadPath, fileName3); //변환된 파일 객체3-1
			 try {
			 multi1.transferTo(saveFile1);	 
			 System.out.println("두근1"+saveFile1);
			 multi2.transferTo(saveFile2);	 
			 System.out.println("두근2"+saveFile2);
			 multi3.transferTo(saveFile3);	 
			 System.out.println("두근3"+saveFile3);
		 		 } catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
					 mav.setViewName(gotoPage);
				 }
				 else {
					 mav.setViewName(getPage);
				 }
			 
		 	 return mav; 
			
		 }
}

