package admin.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("CoDao")
public class CoDao {
	private String namespace = "admin.model.Co";
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<CoBean> coursesAll(Map<String,String> map){
		List<CoBean> colist = new ArrayList<CoBean>();
		colist = sqlSessionTemplate.selectList(namespace+".CoursesAll",map);
		return colist;
	}
	
	public int insertCourses(CoBean cobean) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace+".InsertCourses",cobean);
		return cnt;
	}
	
	public CoBean coursesCount(String conum) {
		CoBean cobean = sqlSessionTemplate.selectOne(namespace+".CoursesCount",conum);
		return cobean;
	}
	
}
