package fodics.web.jsy.main.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fodics.web.jsy.main.model.dto.Main;

@Repository
public class MainDAO {
	
	@Autowired
	private SqlSessionTemplate sql;

	public List<Main> tableDataList() {
		return sql.selectList("mainMapper.tableDataList");
	}
	
	

}
