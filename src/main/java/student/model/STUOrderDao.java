package student.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("OrderDao")
public class STUOrderDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private String namespace="student.model.STUOrder";
	
	public int insertOrder(STUOrderBean obean) { 
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace+".InsertOrder", obean);
		return cnt;
	}

	public int getMaxOnum(String aid) {
		
		int maxOnum = sqlSessionTemplate.selectOne(namespace+".GetMaxOnum",aid);
		
		return maxOnum;
	}

	public List<STUOrderBean> orderList(String aid) {
		List<STUOrderBean> list=sqlSessionTemplate.selectList(namespace+".OrderList",aid);
		
		return list;
	}
	
	public List<STUOrderBean> orderAll(){
		List<STUOrderBean> list = new ArrayList<STUOrderBean>();
		list = sqlSessionTemplate.selectList(namespace+".OrderAll");
		return list;
	}
	
}
