package boardst.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("myBSTdao")
public class BSTDao {
	
	private String namespace = "boardst.sql";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int getTotalCount(Map<String, String> map) {
		int totalcount = sqlSessionTemplate.selectOne(namespace + ".GetTotalCount",map);
		
		return totalcount;
	}
	
	public List<BSTBean> getAllBoard(Paging pageInfo, Map<String, String> map){
		List<BSTBean> boardArr = new ArrayList<BSTBean>();
		
		RowBounds rowbounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		
		boardArr = sqlSessionTemplate.selectList(namespace + ".GetAllBoard",map,rowbounds);
		
		return boardArr;
	}

	public BSTBean getBoardByNum(int num) {
		
		BSTBean board = sqlSessionTemplate.selectOne(namespace + ".GetBoardByNum", num);
		
		return board;
	}

	public BSTReplyBean getBoardReplyByNum(int num) {
		
		BSTReplyBean reply = sqlSessionTemplate.selectOne(namespace + ".GetBoardReplyByNum",num);
		
		return reply;
	}

	public int insertReply(BSTReplyBean replyBean) {
		int cnt = -1;
		
		cnt = sqlSessionTemplate.insert(namespace + ".InsertReply", replyBean);
		
		return cnt;
	}

	public int updateCheck(int num) {
		int cnt = -1;
		
		cnt =sqlSessionTemplate.update(namespace + ".UpdateCheck", num);
		
		return cnt;
	}
	
	public int insertBoard(BSTBean bstBean) {
		int cnt = -1;
		
		cnt = sqlSessionTemplate.insert(namespace + ".InsertBoard", bstBean);
		
		return cnt;
	}
	
	public int updateBoard(BSTBean bstbean) {
		int cnt;
		
		cnt = sqlSessionTemplate.update(namespace + ".UpdateBoard", bstbean);
		
		return cnt;
	}

	public int updateReply(BSTReplyBean bstReplyBean) {
		
		int cnt = -1;
		
		cnt = sqlSessionTemplate.update(namespace + ".UpdateReply", bstReplyBean);
		
		return cnt;
	}

	public int deleteBoard(int num) {
		int cnt;
		
		cnt = sqlSessionTemplate.delete(namespace + ".DeleteBoard", num);
		
		return cnt;
	}

	public int deleteReply(int num) {
		int cnt;
		
		cnt = sqlSessionTemplate.delete(namespace + ".DeleteReply", num);
		
		return cnt;
	}

	public int updateCheck_delete(int num) {
		int cnt =-1;
		
		cnt = sqlSessionTemplate.update(namespace + ".UpdateCheck_Delete", num);
		
		return cnt;
	}
	
	public List<String> getSubjectArr() {
		List<String> subjectArr = new ArrayList<String>();
		
		subjectArr = sqlSessionTemplate.selectList(namespace + ".GetSubjectArr");
		
		return subjectArr;
	}

	public List<String> getTeacherArr() {
		List<String> teacherArr = new ArrayList<String>();
		
		teacherArr = sqlSessionTemplate.selectList(namespace + ".GetTeacherArr");
		
		return teacherArr;
	}
	
}
