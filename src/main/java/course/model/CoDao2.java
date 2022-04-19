
package course.model;

import java.util.ArrayList;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("myCoDao2")
public class CoDao2 {
	
	private String namespace = "course.model.CoBean2";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<CoBean2> coursesAll(Map<String,String> map){
		List<CoBean2> colist = new ArrayList<CoBean2>();
		colist = sqlSessionTemplate.selectList(namespace+".CoursesAll",map);
		return colist;
	}
	
// page 번호 있는 것
	public List<CoBean2> coursesAllpage(Paging pageInfo, Map<String,String> map){
		RowBounds rowbounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		List<CoBean2> colist = new ArrayList<CoBean2>();
		colist = sqlSessionTemplate.selectList(namespace+".CoursesAllpage",map,rowbounds);
		return colist;
	}
	
	public int insertCourses(CoBean2 cobean) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace+".InsertCourses",cobean);
		return cnt;
	}
	
	public CoBean2 coursesCount(String conum) { //강의 상세보기
		CoBean2 cobean = sqlSessionTemplate.selectOne(namespace+".CoursesCount",conum);
		return cobean;
	}
	
	public int updateCourses(CoBean2 cobean) {
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
