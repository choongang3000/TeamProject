package boardt.model;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class BTBean {
	
	private int num;
	private final String msg = "필수 항목입니다(입력/선택)";
	
	@NotBlank(message = "과목 " + msg)
	private String subject;
	
	@NotBlank(message = "문제 파일 " + msg)
	private String examfile;
	
	@NotBlank(message = "문제 답 " + msg)
	private String answer;
	
	@NotBlank(message = "비밀번호 " + msg)
	private String passwd;
	
	@NotBlank(message = "기본 퀴즈 이미지 " + msg)
	private String quizimg;

	@NotBlank(message = "기본 정답 이미지 " + msg)
	private String movingimg;
	

	private MultipartFile upload1; //input type="file" 글자가 아니라 이미지가 들어옴. name에 있는건.. 컨트롤에서 커맨드 객체 생성할 때 세팅할 변수명이 들어감.
	
	public MultipartFile getUpload1() {
		return upload1;
	}
	
	public void setUpload1(MultipartFile upload1) {
		this.upload1 = upload1;
		examfile = upload1.getOriginalFilename();
	}
	
	private MultipartFile upload2; //input type="file" 글자가 아니라 이미지가 들어옴. name에 있는건.. 컨트롤에서 커맨드 객체 생성할 때 세팅할 변수명이 들어감.
	
	public MultipartFile getUpload2() {
		return upload2;
	}
	
	public void setUpload2(MultipartFile upload2) {
		this.upload2 = upload2;
		quizimg = upload2.getOriginalFilename();
	}

	private MultipartFile upload3; //input type="file" 글자가 아니라 이미지가 들어옴. name에 있는건.. 컨트롤에서 커맨드 객체 생성할 때 세팅할 변수명이 들어감.
	
	public MultipartFile getUpload3() {
		return upload3;
	}
	
	public void setUpload3(MultipartFile upload3) {
		this.upload3 = upload3;
		movingimg = upload3.getOriginalFilename();
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getExamfile() {
		return examfile;
	}

	public void setExamfile(String examfile) {
		this.examfile = examfile;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getMovingimg() {
		return movingimg;
	}

	public void setMovingimg(String movingimg) {
		this.movingimg = movingimg;
	}

	public String getQuizimg() {
		return quizimg;
	}

	public void setQuizimg(String quizimg) {
		this.quizimg = quizimg;
	}
	
	
}