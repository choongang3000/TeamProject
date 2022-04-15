package student.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("OrderDeDao")
public class STUOrderDeDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace="student.model.STUOrderDe";

	public void insertOrderDetail(STUOrderDeBean odBean) {
		System.out.println(odBean.getOid());
		System.out.println(odBean.getOnum());
		sqlSessionTemplate.insert(namespace+".InsertOrderDetail",odBean);
	}

}
