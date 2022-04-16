package student.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import admin.model.CoBean;

@Component("myStuCartDao")
public class StuCartDao {

	private String namespace = "student.model.STU";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public CoBean getCourseByConum(int conum) {
		CoBean cobean = null;
		
		cobean = sqlSessionTemplate.selectOne(namespace + ".GetCourseByConum",conum);
		
		return cobean;	
	}
	
}
