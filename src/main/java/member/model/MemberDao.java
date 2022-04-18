package member.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import admin.model.TeacherBean;
import admin.model.TeacherDao;
import course.model.COSBean;
import member.model.MemberBean;
import utility.Paging;

@Component("myMemberDao")//媛앹껜�깮�꽦
public class MemberDao {
private String namespace="member.model.Member";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int insertMember(MemberBean member) {
		int cnt=-1;
		cnt=sqlSessionTemplate.insert(namespace+".InsertMember",member);
		return cnt;
	}


	public MemberBean searchId(String id) {
		MemberBean sbean= null;
		sbean = sqlSessionTemplate.selectOne(namespace+".SearchId",id);
		return sbean;

	}
	
	public String idCheck(String id) {
		String result = null;
		
		result = sqlSessionTemplate.selectOne(namespace + ".IdCheck",id);
		
		return result;
	}
	
	public int updatePw(LoginBean logbean) {
		int cnt = -1;
		
		cnt = sqlSessionTemplate.update(namespace + ".UpdatePw", logbean);
		
		return cnt;
	}
	
	public String getPw(String id) {
		String result = null;
		
		result = sqlSessionTemplate.selectOne(namespace + ".GetPw", id);
		
		return result;
	}
	
	public MemberBean searchIdByBean(LoginBean logbean) {
		MemberBean sbean= null;
		sbean = sqlSessionTemplate.selectOne(namespace+".SearchIdByBean", logbean);
		return sbean;

	}
	
	
	public List<MemberBean> memberAll() {
		List<MemberBean> mlist = new ArrayList<MemberBean>();
		mlist = sqlSessionTemplate.selectList(namespace+".MemberAll");
		return mlist;		
	}
	
	public MemberBean selectMember(int anum) {
		MemberBean mbean = sqlSessionTemplate.selectOne(namespace+".SelectMember",anum);
		return mbean;
	}
	
	public void updateMember(MemberBean mbean) {
		sqlSessionTemplate.update(namespace+".UpdateMember",mbean);
	}
	
	public void deleteMember(MemberBean mb) {
		 sqlSessionTemplate.delete(namespace + ".DeleteMember", mb);
	}
	
	public TeacherBean getTeacherData(String anum) {
		TeacherBean tbean = sqlSessionTemplate.selectOne(namespace + ".GetTeacherData",anum);
		
		return tbean;
	}
	
	public int getCourseCount(Map<String,String> map) {
		
		int totalcount = sqlSessionTemplate.selectOne(namespace + ".GetCourseCount", map);
		
		return totalcount;
	}
	
	public List<COSBean> getAllCourse( Map<String,String> map, Paging pageInfo){
		
		System.out.println("여기!! map >> " + map);
		
		List<COSBean> cosArr = new ArrayList<COSBean>();
		
		RowBounds rowbounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		
		cosArr = sqlSessionTemplate.selectList(namespace + ".GetAllCourse", map, rowbounds);
		
		return cosArr;
	}
	
	public List<String> getSubject(){
		List<String> subArr = new ArrayList<String>();
		
		subArr = sqlSessionTemplate.selectList(namespace + ".GetSubject");
		
		return subArr;
	}
	
}
