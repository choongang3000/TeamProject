package student.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import admin.model.TeacherBean;

@Component("mySTDao")
public class STDao {
	
	private String namespace = "student.model.STU";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
}
