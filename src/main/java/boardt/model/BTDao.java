package boardt.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
//import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.COSListPaging;

//import utility.BTPaging;

@Component("mybtdao")
public class BTDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private String namespace="boardt.model.BTBean";
	
	public int getTotalCount(Map<String, String> map) { 
		int count = sqlSessionTemplate.selectOne(namespace+".GetTotalCount",map);// 레코드 갯수를 갖고 돌아옴.(레코드 하나만 갖고오라는 의미가 아니라 1000개면 갯수 1000을 들고오라는 뜻)
		return count;
	}
	
	
	public List<BTBean> getBoardList(COSListPaging pageInfo, Map<String,String> map){
		List<BTBean> lists = new ArrayList<BTBean>(); //여러개 갖고 올거니까 ArrayList 준비
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit()); //내가 지금 선택한 페이지에 따라(pageinfo) 몇개를 건너뛰어야하는지 Offset에 들어가게됨. 4개 건너뛰고 2개 갖고 오는 설정으로 RowBounds를 갖고오고..
		//lists = sqlSessionTemplate.selectList(namespace + ".GetBoardList",rowBounds); 
		lists = sqlSessionTemplate.selectList(namespace + ".select",map,rowBounds); 
		return lists;
	}
	
	
	/*
	
	조건 검색 전..
	
	public int getTotalCount() { 
		int count = sqlSessionTemplate.selectOne(namespace+".GetTotalCount");// 레코드 갯수를 갖고 돌아옴.(레코드 하나만 갖고오라는 의미가 아니라 1000개면 갯수 1000을 들고오라는 뜻)
		return count;
	}
	
	public List<BTBean> getBoardList(BTPaging pageInfo){
		List<BTBean> lists = new ArrayList<BTBean>(); //여러개 갖고 올거니까 ArrayList 준비
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit()); //내가 지금 선택한 페이지에 따라(pageinfo) 몇개를 건너뛰어야하는지 Offset에 들어가게됨. 4개 건너뛰고 2개 갖고 오는 설정으로 RowBounds를 갖고오고..
		lists = sqlSessionTemplate.selectList(namespace + ".GetBoardList",rowBounds); 
		return lists;
	}
	
	*/
	
	/*
	
	** 키워드 검색할 때 사용
	
	public int getTotalCount(Map<String, String> map) { //Map<String,String>타입의 map이 넘어오니까 Map<String,String>타입으로 받아야함.
		int count = sqlSessionTemplate.selectOne(namespace+".GetTotalCount",map); //.xml에 가서 id가 GetTotalCount인 문장을 실행하고 결과로 레코드 갯수를 갖고 돌아옴.(레코드 하나만 갖고오라는 의미가 아니라 1000개면 갯수 1000을 들고오라는 뜻)
		return count;
	}
	
	public List<BTBean> getBoardList(BTPaging pageInfo,Map<String,String> map){
		List<BTBean> lists = new ArrayList<BTBean>(); //여러개 갖고 올거니까 ArrayList 준비
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit()); //내가 지금 선택한 페이지에 따라(pageinfo) 몇개를 건너뛰어야하는지 Offset에 들어가게됨. 4개 건너뛰고 2개 갖고 오는 설정으로 RowBounds를 갖고오고..
		lists = sqlSessionTemplate.selectList(namespace + ".GetBoardList",rowBounds); 
		return lists;
	}
	
	*/
	
	//BTInsertController.java
	public int btinsert(BTBean btbean) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace+".btinsert", btbean);
		return cnt;
	}
	
	//BTDeleteController
	public int btdelete(String num) {
		int cnt = sqlSessionTemplate.delete(namespace+".btdelete",num);
		return cnt;
	}

	//BTUpdateController,BTDetailController - 번호를 가지고 전체 조회
	public BTBean getNumBoardList(String num) {
		BTBean btbean = sqlSessionTemplate.selectOne(namespace + ".GetNumBoardList", num);
		return btbean;
	}

	//BTUpdateController
	public int btupdate(BTBean btbean) {
		int cnt=-1;
		cnt = sqlSessionTemplate.update(namespace + ".btupdate", btbean);
		return cnt;
	}

	public List<String> getSubList() {
		List<String> lists = new ArrayList<String>();
		lists = sqlSessionTemplate.selectList(namespace+".selectsub");
		return lists;
	}
	
	public List<BTBean> getAnswer(){
		List<BTBean> lists = new ArrayList<BTBean>();
		lists = sqlSessionTemplate.selectList(namespace+".selectanswer");
		return lists;
	}
}
