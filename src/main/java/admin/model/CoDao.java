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
	
	public int updateCourses(CoBean cobean) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace+".UpdateCourses",cobean);
		return cnt;
	}
	
	public int deleteCourses(String conum) {
		int cnt = -1;
		cnt = sqlSessionTemplate.delete(namespace+".DeleteCourses",conum);
		return cnt;
	}
	
	public int totalCount(Map<String, String> map) {
		int count = sqlSessionTemplate.selectOne(namespace+".GetCOSListCount",map);
		return count;
	}
	
}
