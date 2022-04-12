package boarda.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import boarda.model.BABean;
import utility.Paging;

@Component("BADao")
public class BADao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace="boarda.model.BABean";
	
	public int totalCount(Map<String, String> map) {
		int count = sqlSessionTemplate.selectOne(namespace+".GetBAListCount",map);
		return count;
	}
	
	public List<BABean> getBAList(Paging pageInfo, Map<String, String> map){
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<BABean> list = sqlSessionTemplate.selectList(namespace+".GetBAList",map,rowBounds);
		return list;
	}
	
	public BABean getBA(String num) {
		BABean bean = sqlSessionTemplate.selectOne(namespace+".GetBA", num);
		
		return bean;
	}
	
	public int insertBA(BABean bean) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace+".InsertBA", bean);
		return cnt;
	}
	
	public int updateBA(BABean bean) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace+".UpdateBA", bean);
		return cnt;
	}
	
	public int deleteBA(int num) {
		int cnt = -1;
		cnt = sqlSessionTemplate.delete(namespace+".DeleteBA", num);
		return cnt;
	}
}

