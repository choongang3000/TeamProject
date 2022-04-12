package admin.model;

import java.util.ArrayList;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("myCoDao")
public class CoDao {
	private String namespace = "admin.model.Co";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<CoBean> coursesAll(Map<String,String> map){
		List<CoBean> colist = new ArrayList<CoBean>();
		colist = sqlSessionTemplate.selectList(namespace+".CoursesAll",map);
		return colist;
	}
	
	/* page 번호 있는 것 */
	public List<CoBean> coursesAllpage(Paging pageInfo, Map<String,String> map){
		RowBounds rowbounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		List<CoBean> colist = new ArrayList<CoBean>();
		colist = sqlSessionTemplate.selectList(namespace+".CoursesAll",map,rowbounds);
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
	
	public void updateCourses(CoBean cobean) {
		sqlSessionTemplate.update(namespace+".UpdateCourses",cobean);
	}
	
	public void deleteCourses(String conum) {
		sqlSessionTemplate.delete(namespace+".DeleteCourses",conum);
	}
	
	public int totalCount(Map<String, String> map) {
		int count = sqlSessionTemplate.selectOne(namespace+".GetCOSListCount",map);
		return count;
	}
	
}
