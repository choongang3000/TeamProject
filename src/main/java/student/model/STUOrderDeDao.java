package student.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("OrderDeDao")
public class STUOrderDeDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace="student.model.STUOrderDe";

	public int insertOrderDetail(STUOrderDeBean odBean) {
		int cnt=-1;
		
		cnt = sqlSessionTemplate.insert(namespace+".InsertOrderDetail",odBean);
	
		return cnt;
	}
	
	public int getCountOrderDetail(int onum) {
		int count = sqlSessionTemplate.selectOne(namespace + ".GetCountOrderDetail",onum);
		
		return count;
	}
	
	
	public List<STUOrderDeBean> getOrderDetailList(int onum){
		List<STUOrderDeBean> odbeanArr = new ArrayList<STUOrderDeBean>();
		
		odbeanArr = sqlSessionTemplate.selectList(namespace + ".GetOrderDetailList",onum);
		
		return odbeanArr;
	}
	

}
