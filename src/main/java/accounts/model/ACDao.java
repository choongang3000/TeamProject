package accounts.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import course.controller.COSListController;
import teachers.controller.TEListController;

@Component("ACDao")
public class ACDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace="accounts.model.ACBean";
}