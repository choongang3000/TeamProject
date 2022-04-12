package boarda.model;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

public class BABean {
	private int banum;
	
	@NotBlank(message = "카테고리를 설정하세요.")
	private String bacategory;
	
	@NotBlank(message = "질문을 입력하세요.")
	private String basubject;
	
	@NotBlank(message = "답변을 입력하세요.")
	private String bacontent;
	private String baimage;
	private String bafile;
	private MultipartFile upload;
	
	public int getBanum() {
		return banum;
	}
	public void setBanum(int banum) {
		this.banum = banum;
	}
	public String getBacategory() {
		return bacategory;
	}
	public void setBacategory(String bacategory) {
		this.bacategory = bacategory;
	}
	public String getBasubject() {
		return basubject;
	}
	public void setBasubject(String basubject) {
		this.basubject = basubject;
	}
	public String getBacontent() {
		return bacontent;
	}
	public void setBacontent(String bacontent) {
		this.bacontent = bacontent;
	}
	public String getBafile() {
		return bafile;
	}
	public void setBafile(String bafile) {
		this.bafile = bafile;
	}
	public String getBaimage() {
		return baimage;
	}
	public void setBaimage(String baimage) {
		this.baimage = baimage;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
		System.out.println("upload:" + upload);
		System.out.println("upload.getName():"+upload.getName());
		System.out.println("upload.getOriginalFilename():"+upload.getOriginalFilename());
		baimage = upload.getOriginalFilename();
	}
		
}
