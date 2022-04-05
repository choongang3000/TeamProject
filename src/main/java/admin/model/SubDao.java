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
}
