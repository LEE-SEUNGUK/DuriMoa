package com.ugi.durimoa;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ugi.durimoa.member.vo.MemberVO;
import com.ugi.durimoa.travel.service.TravelService;
import com.ugi.durimoa.travel.vo.TravelInfoVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
    private TravelService travelService;
	
	@RequestMapping("/")
	public String home(Model model, HttpSession session) throws Exception {
		
        MemberVO login = (MemberVO) session.getAttribute("login");

		ArrayList<TravelInfoVO> markerList = travelService.getTravelList(login);
		
		System.out.println(markerList);
		
		model.addAttribute("markerList", markerList);
		
		return "home";
	}
}
