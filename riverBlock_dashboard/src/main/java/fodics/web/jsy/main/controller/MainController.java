package fodics.web.jsy.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import fodics.web.jsy.main.model.service.MainService;

@Controller
public class MainController {
	
	
	@Autowired
	private MainService service;

}
