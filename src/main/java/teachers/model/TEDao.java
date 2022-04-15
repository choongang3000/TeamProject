package teachers.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import boarda.model.BABean;
import course.model.COSBean;
import utility.Paging;

@Component("TEDao")
public class TEDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	private String namespace = "teachers.model.TEBean";

	public int totalCount(Map<String, String> map) {
		int count = sqlSessionTemplate.selectOne(namespace + ".GetTEListCount", map);
		return count;
	}

	public List<TEBean> getTEList(Paging pageInfo, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<TEBean> list = sqlSessionTemplate.selectList(namespace + ".GetTEList", map, rowBounds);
		return list;
	}

	public BABean getTE(String num) {
		BABean bean = sqlSessionTemplate.selectOne(namespace + ".GetTE", num);

		return bean;
	}

	public int insertTE(TEBean bean) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace + ".InsertTE", bean);
		return cnt;
	}

	public int updateTE(TEBean bean) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace + ".UpdateTE", bean);
		return cnt;
	}

	public int deleteTE(int num) {
		int cnt = -1;
		cnt = sqlSessionTemplate.delete(namespace + ".DeleteTE", num);
		return cnt;
	}

	public List<TEBean> getTEList() {
		List<TEBean> list = sqlSessionTemplate.selectList(namespace + ".GetTEList");
		return list;
	}
	/*
	 * public TEBean getTEList(String tname){ TEBean tbean =
	 * sqlSessionTemplate.selectOne(namespace+".GetTeSubList",tname); return tbean;
	 * }
	 */

	/* JH - 강사별 강의목록 출력 (관련:TEsubListController/course.xml) */
	public List<TEBean> getTESubList(TEBean bean) {
		// System.out.println(tname);
		System.out.println("빈으로 출력해보자" + bean.getSubject());
		List<TEBean> list = sqlSessionTemplate.selectList(namespace + ".GetTeSubList", bean);
		return list;
	}

	/*
	 public TEBean getTESubOne(String tname) { 
		 TEBean tbean = sqlSessionTemplate.selectOne(namespace+".GeTTeSubOne", tname); 
		 return tbean;
	 }
	 */
}
