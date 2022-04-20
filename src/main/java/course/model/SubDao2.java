package course.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("SubDao2")
public class SubDao2 {
	private String namespace = "course.model.SubBean2";
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<SubBean2> subjectAll() {
		List<SubBean2> sublist = new ArrayList<SubBean2>();
		sublist = sqlSessionTemplate.selectList(namespace+".SubjectAll");
		return sublist;		
	}
	
	public void insertSubject(SubBean2 subbean) {
		sqlSessionTemplate.insert(namespace+".InsertSubject",subbean);
	}
	
	public SubBean2 selectSubject(String subnum) {
		SubBean2 subbean = sqlSessionTemplate.selectOne(namespace+".SelectSubject",subnum);
		return subbean;
	}
	
	public void updateSubject(SubBean2 subbean) {
		sqlSessionTemplate.update(namespace+".UpdateSubject",subbean);
	}
	
	public void deleteSubject(String subnum) {
		sqlSessionTemplate.delete(namespace+".DeleteSubject",subnum);
	}
	
}
