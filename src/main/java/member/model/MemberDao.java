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
	
	public TeacherBean getTeacherData(String anum) {
		TeacherBean tbean = sqlSessionTemplate.selectOne(namespace + ".GetTeacherData",anum);
		
		return tbean;
	}

}
