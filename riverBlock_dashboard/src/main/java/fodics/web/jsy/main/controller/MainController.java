package fodics.web.jsy.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public Map<String, Object> loadData(@RequestBody String occuDate) {
	    
	    
	    System.out.println("occuDate: " + occuDate);
	    
	    List<Main> tableDataList = service.tableDataList();
	    
	    
	    Map<String, Object> map = new HashMap<>();
	    map.put("tableDataList", tableDataList);
	    

	    
	    return map; 
	}
	
}
