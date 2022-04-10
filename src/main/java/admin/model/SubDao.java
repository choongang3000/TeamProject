package admin.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("SubDao")
public class SubDao {
	private String namespace = "admin.model.Sub";
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<SubBean> subjectAll() {
		List<SubBean> sublist = new ArrayList<SubBean>();
		sublist = sqlSessionTemplate.selectList(namespace+".SubjectAll");
		return sublist;		
	}
	
	public void insertSubject(SubBean subbean) {
		sqlSessionTemplate.insert(namespace+".InsertSubject",subbean);
	}
	
	public SubBean selectSubject(String subnum) {
		SubBean subbean = sqlSessionTemplate.selectOne(namespace+".SelectSubject",subnum);
		return subbean;
	}
	
	public void updateSubject(SubBean subbean) {
		sqlSessionTemplate.update(namespace+".UpdateSubject",subbean);
	}
	
	public void deleteSubject(String subnum) {
		sqlSessionTemplate.delete(namespace+".DeleteSubject",subnum);
	}
}
