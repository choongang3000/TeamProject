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
	
	public void insertOrder(String oid) { 
		sqlSessionTemplate.insert(namespace+".InsertOrder",oid);
		/* return cnt; */
	}

	public int getMaxOid() {
		int maxOid=sqlSessionTemplate.selectOne(namespace+".GetMaxOid");
		System.out.println("maxOid1:" + maxOid);
		return maxOid;
	}

	public List<STUOrderBean> orderList(String oid) {
		List<STUOrderBean> list=sqlSessionTemplate.selectList(namespace+".OrderList",oid);
		return list;
	}

}
