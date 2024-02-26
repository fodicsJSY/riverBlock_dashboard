package fodics.web.jsy.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String loadData(@RequestBody String occuDate, Model model) {
	    
	    
	    System.out.println("occuDate: " + occuDate);
	    

	    
	    return occuDate; 
	}
	
}
