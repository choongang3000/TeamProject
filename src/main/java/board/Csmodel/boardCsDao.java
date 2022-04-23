package board.Csmodel;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import course.model.COSBean;
import utility.COSListPaging;
import utility.Paging;

@Component("boardDao")
public class boardCsDao {
	
	private String namespace = "board.xml";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int getArticlesCount1(Map<String, String> map) {
		int articlecount = sqlSessionTemplate.selectOne(namespace + ".GetArticleCoun1t",map);
		return articlecount;
	}
	
	public int getArticlesCount2() {
		int articlecount = sqlSessionTemplate.selectOne(namespace + ".GetArticleCount2");
		return articlecount;
	}
	
	public List<boardCsBean> getArticles1(Paging pageInfo, Map<String, String> map){
		
		RowBounds rowbounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		
		List<boardCsBean> list = new ArrayList<boardCsBean>();
		
		list = sqlSessionTemplate.selectList(namespace + ".GetArticles1",map,rowbounds);
		
		return list;
	}
	
	public List<boardCsBean> getArticles2(Map<String, String> map, Paging pageInfo){
		
		RowBounds rowbounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		
		List<boardCsBean> list = new ArrayList<boardCsBean>();
		
		list = sqlSessionTemplate.selectList(namespace + ".GetArticles2",map,rowbounds);
		
		return list;
	}
	
	
	public int insertArticle(boardCsBean bb) {
		int cnt=-1;
		
		cnt = sqlSessionTemplate.insert(namespace + ".InsertArticle", bb);
		
		return cnt;
	}//insertArticle
	
	public boardCsBean getArticle(String num) {
		
		boardCsBean bb = sqlSessionTemplate.selectOne(namespace + ".GetArticle", num);
		
		return bb;
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
	
	
	public int updateArticle(boardCsBean bb) {
		int cnt=-1;
		
		cnt = sqlSessionTemplate.update(namespace + ".UpdateArticle", bb);
		
		return cnt;
	}
	
	
	public int deleteArticle(String num) {
		int cnt=-1;
		
		cnt = sqlSessionTemplate.delete(namespace + ".DeleteArticle", num);
		
		return cnt;
	}
	
	public int replyArticle_1(boardCsBean bb) {
		int cnt = -1;
		
		cnt = sqlSessionTemplate.update(namespace + ".ReplyArticle_1", bb);
		
		return cnt;
	}

	public int replyArticle_2(boardCsBean bb) {
		int cnt = -1;
		
		cnt = sqlSessionTemplate.insert(namespace + ".ReplyArticle_2", bb);
		
		return cnt;
	}
	
}
