package fodics.web.jsy.main.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fodics.web.jsy.main.model.dao.MainDAO;
import fodics.web.jsy.main.model.dto.Main;

@Service
public class MainServiceImpl implements MainService{

	
		@Autowired
		private MainDAO dao;
		
		
		@Override
		public List<Main> tableDataList() {
		return dao.tableDataList();
		}
}
