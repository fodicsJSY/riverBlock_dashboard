package fodics.web.jsy.main.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;


import fodics.web.jsy.main.model.dto.Main;
import fodics.web.jsy.main.model.service.MainService;

@Controller
public class MainController {
	
	
	@Autowired
	private MainService service;
	
	
	@GetMapping("/")
	public String home() {
		return "main";
	}

	
	@PostMapping("/sendDate")
	@ResponseBody
	public Map<String, Object> loadData(
			@RequestBody Map<String, Object> paramMap
//			@RequestBody String occuDate
			) {
	    
		System.out.println("paramMap: " + paramMap);
		 String occuDateString = (String) paramMap.get("occuDate");
		 DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		 LocalDate occuDate = LocalDate.parse(occuDateString, formatter);
	    System.out.println("occuDate: " + occuDate);
	    
	    // 개문 데이터
	    List<Main> openGateList = service.openGateList(occuDate);
	    
	    // 폐문 데이터
	    List<Main> closeGateList = service.closeGateList(occuDate);
	    
	    //테이블 데이터
	    List<Main> tableDataList = service.tableDataList();
	    
	    
	    Map<String, Object> map = new HashMap<>();
	    map.put("tableDataList", tableDataList);
	    map.put("openGateList", openGateList);
	    map.put("closeGateList", closeGateList);
	    
	    System.out.println("map : " + map);
	    
	    return map; 
	}
	
}
