package boardt.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
//import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.BTPaging;

//import utility.BTPaging;

@Component("mybtdao")
public class BTDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private String namespace="boardt.model.BTBean";
	
	public int getTotalCount(Map<String, String> map) { 
		int count = sqlSessionTemplate.selectOne(namespace+".GetTotalCount",map);// ���ڵ� ������ ���� ���ƿ�.(���ڵ� �ϳ��� �������� �ǹ̰� �ƴ϶� 1000���� ���� 1000�� ������� ��)
		return count;
	}
	
	
	public List<BTBean> getBoardList(BTPaging pageInfo, Map<String,String> map){
		List<BTBean> lists = new ArrayList<BTBean>(); //������ ���� �ðŴϱ� ArrayList �غ�
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit()); //���� ���� ������ �������� ����(pageinfo) ��� �ǳʶپ���ϴ��� Offset�� ���Ե�. 4�� �ǳʶٰ� 2�� ���� ���� �������� RowBounds�� �������..
		//lists = sqlSessionTemplate.selectList(namespace + ".GetBoardList",rowBounds); 
		lists = sqlSessionTemplate.selectList(namespace + ".select",map,rowBounds); 
		return lists;
	}
	
	
	/*
	
	���� �˻� ��..
	
	public int getTotalCount() { 
		int count = sqlSessionTemplate.selectOne(namespace+".GetTotalCount");// ���ڵ� ������ ���� ���ƿ�.(���ڵ� �ϳ��� �������� �ǹ̰� �ƴ϶� 1000���� ���� 1000�� ������� ��)
		return count;
	}
	
	public List<BTBean> getBoardList(BTPaging pageInfo){
		List<BTBean> lists = new ArrayList<BTBean>(); //������ ���� �ðŴϱ� ArrayList �غ�
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit()); //���� ���� ������ �������� ����(pageinfo) ��� �ǳʶپ���ϴ��� Offset�� ���Ե�. 4�� �ǳʶٰ� 2�� ���� ���� �������� RowBounds�� �������..
		lists = sqlSessionTemplate.selectList(namespace + ".GetBoardList",rowBounds); 
		return lists;
	}
	
	*/
	
	/*
	
	** Ű���� �˻��� �� ���
	
	public int getTotalCount(Map<String, String> map) { //Map<String,String>Ÿ���� map�� �Ѿ���ϱ� Map<String,String>Ÿ������ �޾ƾ���.
		int count = sqlSessionTemplate.selectOne(namespace+".GetTotalCount",map); //.xml�� ���� id�� GetTotalCount�� ������ �����ϰ� ����� ���ڵ� ������ ���� ���ƿ�.(���ڵ� �ϳ��� �������� �ǹ̰� �ƴ϶� 1000���� ���� 1000�� ������� ��)
		return count;
	}
	
	public List<BTBean> getBoardList(BTPaging pageInfo,Map<String,String> map){
		List<BTBean> lists = new ArrayList<BTBean>(); //������ ���� �ðŴϱ� ArrayList �غ�
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit()); //���� ���� ������ �������� ����(pageinfo) ��� �ǳʶپ���ϴ��� Offset�� ���Ե�. 4�� �ǳʶٰ� 2�� ���� ���� �������� RowBounds�� �������..
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

	//BTUpdateController,BTDetailController - ��ȣ�� ������ ��ü ��ȸ
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
