package student.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("OrderDao")
public class STUOrderDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private String namespace="student.model.STUOrder";
	
	public int insertOrder(String aid) { 
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace+".InsertOrder",aid);
		return cnt;
	}

	public int getMaxOnum() {
		int maxOnum = sqlSessionTemplate.selectOne(namespace+".GetMaxOnum");
		System.out.println("maxOnum:" + maxOnum);
		return maxOnum;
	}

	public List<STUOrderBean> orderList(String aid) {
		List<STUOrderBean> list=sqlSessionTemplate.selectList(namespace+".OrderList",aid);
		return list;
	}

}
