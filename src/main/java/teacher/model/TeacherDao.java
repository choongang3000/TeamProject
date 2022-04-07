package teacher.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("myTeacherDao")
public class TeacherDao {
	
	private String namespace = "teacher.model.TC";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int getTeacherCount(Map<String, String> map) {
		
		int totalcount = sqlSessionTemplate.selectOne(namespace + ".GetTeacherCount", map);
		
		return totalcount;
	}

	public List<TeacherBean> getAllTeacher( Map<String, String> map ) {
		List<TeacherBean> teacherArr = new ArrayList<TeacherBean>();
		
		
		teacherArr = sqlSessionTemplate.selectList(namespace + ".GetAllTeacher", map);
		
		return teacherArr;
	}
	
	public List<String> getSubject() {
		List<String> subArr = new ArrayList<String>();
		
		subArr = sqlSessionTemplate.selectList(namespace + ".GetSubject");
		
		return subArr;
		
	}

	public int insertAccount(TeacherBean tBean) {
		int cnt = -1;
		
		cnt = sqlSessionTemplate.insert(namespace + ".InsertAccount",tBean);
		
		return cnt;
	}

	public int insertTeacher(TeacherBean tBean) {
		int cnt = -1;
		
		cnt = sqlSessionTemplate.insert(namespace + ".InsertTeacher",tBean);
		
		return cnt;
	}

	public TeacherBean getTeacherData(int anum) {
		
		TeacherBean tbean = sqlSessionTemplate.selectOne(namespace + ".GetTeacherData", anum);
		
		return tbean;
	}

	public int updateTeacher(TeacherBean tbean) {
		int cnt = -1;
		
		cnt = sqlSessionTemplate.update(namespace + ".UpdateTeacher", tbean);
		
		return cnt;
	}
	public int updateAccount(TeacherBean tbean) {
		int cnt = -1;
		
		cnt = sqlSessionTemplate.update(namespace + ".UpdateAccount", tbean);
		
		return cnt;
	}

	public int deleteAccount(int anum) {
		int cnt = -1;
		
		cnt = sqlSessionTemplate.delete(namespace + ".DeleteAccount", anum); 
		
		return cnt;
	}

	public int deleteTeacher(int tnum) {
		int cnt = -1;
		
		cnt = sqlSessionTemplate.delete(namespace + ".DeleteTeacher", tnum); 
		
		return cnt;
	}
	
	
}
