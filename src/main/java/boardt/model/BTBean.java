package boardt.model;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class BTBean {
	
	private int num;
	private final String msg = "�ʼ� �׸��Դϴ�(�Է�/����)";
	
	@NotBlank(message = "���� " + msg)
	private String subject;
	
	@NotBlank(message = "���� ���� " + msg)
	private String examfile;
	
	@NotBlank(message = "���� �� " + msg)
	private String answer;
	
	@NotBlank(message = "��й�ȣ " + msg)
	private String passwd;
	
	@NotBlank(message = "�⺻ ���� �̹��� " + msg)
	private String quizimg;

	@NotBlank(message = "�⺻ ���� �̹��� " + msg)
	private String movingimg;
	

	private MultipartFile upload1; //input type="file" ���ڰ� �ƴ϶� �̹����� ����. name�� �ִ°�.. ��Ʈ�ѿ��� Ŀ�ǵ� ��ü ������ �� ������ �������� ��.
	
	public MultipartFile getUpload1() {
		return upload1;
	}
	
	public void setUpload1(MultipartFile upload1) {
		this.upload1 = upload1;
		examfile = upload1.getOriginalFilename();
	}
	
	private MultipartFile upload2; //input type="file" ���ڰ� �ƴ϶� �̹����� ����. name�� �ִ°�.. ��Ʈ�ѿ��� Ŀ�ǵ� ��ü ������ �� ������ �������� ��.
	
	public MultipartFile getUpload2() {
		return upload2;
	}
	
	public void setUpload2(MultipartFile upload2) {
		this.upload2 = upload2;
		quizimg = upload2.getOriginalFilename();
	}

	private MultipartFile upload3; //input type="file" ���ڰ� �ƴ϶� �̹����� ����. name�� �ִ°�.. ��Ʈ�ѿ��� Ŀ�ǵ� ��ü ������ �� ������ �������� ��.
	
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