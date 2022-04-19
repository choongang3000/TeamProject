package boards.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("BSDao")
public class BSDao {
	private String namespace = "boards.model.BS";
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int getArticleCount(Map<String, String> map) {
		int articlecount = sqlSessionTemplate.selectOne(namespace + ".GetArticleCount",map);
		return articlecount;
	}
	
	public List<BSBean> getArticles(Map<String, String> map,Paging pageInfo){
		
		RowBounds rowbounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<BSBean> list = new ArrayList<BSBean>();
		list = sqlSessionTemplate.selectList(namespace + ".GetArticles", map, rowbounds);
		return list;
	}
	
	public int insertBS(BSBean bb) { 
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace+".InsertBS", bb);
		return cnt;
	}
	
	/*사용안함
	public int insertArticle(BSBean bsbean) { 
		int cnt=-1;
		cnt = sqlSessionTemplate.insert(namespace + ".InsertArticle", bsbean);
		return cnt;
	}//insertArticle*/
	
	public BSBean getArticle(String num) {
		BSBean bsbean = sqlSessionTemplate.selectOne(namespace + ".GetArticle", num);
		return bsbean;
	}
	
	public int addReadCount(String num) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace + ".AddReadCount",num);
		return cnt;
	}
	
	public String getBoardPassword(String num) {
		String password = sqlSessionTemplate.selectOne(namespace + ".GetBoardPassword",num);
		return password;
	}
	
	public int updateArticle(BSBean bb) {
		int cnt=-1;
		cnt = sqlSessionTemplate.update(namespace + ".UpdateArticle", bb);
		return cnt;
	}
	
	public int deleteArticle(String num) {
		int cnt=-1;
		cnt = sqlSessionTemplate.delete(namespace + ".DeleteArticle", num);
		return cnt;
	}
/*	
	public void replyArticle(BSBean bb) {
		sqlSessionTemplate.update(namespace+".ReplyArticle1",bb);
		sqlSessionTemplate.insert(namespace+".ReplyArticle2",bb);
	}
*/	
	/*
	public int replyArticle_1(BSBean bb) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace + ".ReplyArticle_1", bb);
		return cnt;
	}

	public int replyArticle_2(BSBean bb) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace + ".ReplyArticle_2", bb);
		return cnt;
	}
	*/
}
