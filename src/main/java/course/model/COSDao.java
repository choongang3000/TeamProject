package course.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import boarda.model.BABean;
import utility.Paging;

@Component("COSDao")
public class COSDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace="course.model.COSBean";
	
	public int totalCount(Map<String, String> map) {
		int count = sqlSessionTemplate.selectOne(namespace+".GetCOSListCount",map);
		return count;
	}
	
	public List<COSBean> getCOSList(Paging pageInfo, Map<String, String> map){
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<COSBean> list = sqlSessionTemplate.selectList(namespace+".GetCOSList",map,rowBounds);
		return list;
	}
	
	public COSBean getCOS(int num) {
		COSBean bean = sqlSessionTemplate.selectOne(namespace+".GetCOS", num);
		
		return bean;
	}
	
	public int insertCOS(COSBean bean) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace+".InsertCOS", bean);
		return cnt;
	}
	
	public int updateCOS(COSBean bean) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace+".UpdateCOS", bean);
		return cnt;
	}
	
	public int deleteCOS(int num) {
		int cnt = -1;
		cnt = sqlSessionTemplate.delete(namespace+".DeleteCOS", num);
		return cnt;
	}
}
