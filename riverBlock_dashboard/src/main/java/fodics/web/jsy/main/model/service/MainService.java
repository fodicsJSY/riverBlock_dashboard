package fodics.web.jsy.main.model.service;

import java.time.LocalDate;
import java.util.List;

import fodics.web.jsy.main.model.dto.Main;

public interface MainService {

	// 개문 데이터
	List<Main> openGateList(LocalDate occuDate);

	// 폐문 데이터
	List<Main> closeGateList(LocalDate occuDate);
	
	// 테이블 데이터
	List<Main> tableDataList();
	
	

}
