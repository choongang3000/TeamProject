package teachers.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import boarda.model.BABean;
import course.model.COSBean;
import utility.COSListPaging;
import utility.Paging;

@Component("myTEDao")
public class TEDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	private String namespace = "teachers.model.TEBean";

	public int totalCount(Map<String, String> map) {
		int count = sqlSessionTemplate.selectOne(namespace + ".GetTEListCount", map);
		return count;
	}

	public List<TEBean> getTEList(COSListPaging pageInfo1, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds(pageInfo1.getOffset(), pageInfo1.getLimit());
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
	
	/* KJH - 강사별 강의목록 출력 (관련:TEsubListController/teachers.xml) */
	public List<TEBean> getTESubList(TEBean bean) {
		// System.out.println(tname);
		System.out.println("빈으로 출력해보자" + bean.getSubject());
		List<TEBean> list = sqlSessionTemplate.selectList(namespace + ".GetTeSubList", bean);
		return list;
	}

	/* KJH - 상단 강의탭 - 사이드바 과목 가져오기 */
	public List<String> getSubject(){
		List<String> subArr = new ArrayList<String>();
		subArr = sqlSessionTemplate.selectList(namespace + ".GetSubject");
		return subArr;
	}
}
