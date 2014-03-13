/**
 * 
 */
package com.hmventures.tickets4bus.controller;


import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class HomeController {
        

	@RequestMapping(value="/testpage")
	public String getRequest(Model model, Map<String, Object> map) {
		System.out.println("Hello World......");
		return "testpage";
	}
	
	@RequestMapping(value="/searchpage")
	public String searchResult(Model model, Map<String, Object> map) {
		System.out.println("This is search Result Page");
		return "search_results8";
	}
	
}
