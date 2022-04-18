package course.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.COSListPaging;

@Component("COSDao") /* course.xml 파일로 이동 */
public class COSDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace="course.model.COSBean";
	
	public int totalCount(Map<String, String> map) {
		
		int count = sqlSessionTemplate.selectOne(namespace+".GetCOSListCount",map);
		return count;
	}
	
	/* 상단 강의탭 - 사이드바 과목 눌렀을 때 해당 과목 리스트 띄우기 */

	public List<COSBean> getCOSList(COSListPaging pageInfo, Map<String, String> map){
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
	
	/* 상단 강의탭 - 사이드바 과목 가져오기 */
	public List<String> getSubject(){
		List<String> subArr = new ArrayList<String>();
		
		subArr = sqlSessionTemplate.selectList(namespace + ".GetSubject");
		
		return subArr;
	}

}
