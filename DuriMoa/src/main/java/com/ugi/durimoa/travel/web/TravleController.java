package com.ugi.durimoa.travel.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TravleController {

	@RequestMapping("/travelView")
	public String DiaryView() {

		return "/travel/travelView";
	}
	
	@RequestMapping("/travelWrite")
	public String TravelWrite(){
		
		return "/travel/travelWrite";
	}
}
