package fodics.web.jsy.main.model.dao;

import java.time.LocalDate;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fodics.web.jsy.main.model.dto.Main;

@Repository
public class MainDAO {
	
	@Autowired
	private SqlSessionTemplate sql;

	
	
	
	/**
	 * @return list
	 */
	public List<Main> openGateList(LocalDate occuDate) {
		return sql.selectList("mainMapper.openGateList", occuDate);
	}
	
	/**
	 * @return list
	 */
	public List<Main> closeGateList(LocalDate occuDate) {
		return sql.selectList("mainMapper.closeGateList", occuDate);
	}

	/**
	 * @return list
	 */
	public List<Main> tableDataList() {
		return sql.selectList("mainMapper.tableDataList");
	}

	
	

}
