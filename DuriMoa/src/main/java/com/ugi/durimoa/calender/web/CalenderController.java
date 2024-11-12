package com.ugi.durimoa.calender.web;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ugi.durimoa.calender.service.CalenderService;
import com.ugi.durimoa.calender.vo.CalenderVO;
import com.ugi.durimoa.member.vo.MemberVO;
import com.ugi.durimoa.travel.service.TravelService;
import com.ugi.durimoa.travel.vo.TravelInfoVO;
import com.ugi.durimoa.travel.vo.TravelVO;

@Controller
public class CalenderController {
	
	@Autowired
	CalenderService calenderService;
	
	@RequestMapping("/calender")
	public String calenderView(Model model, HttpSession session) throws JsonProcessingException {
		MemberVO login = (MemberVO) session.getAttribute("login");
		
		calenderService.calenderShow(login.getMemId());

		ArrayList<CalenderVO> calenderList = calenderService.calenderShow(login.getMemId());

		// JSON으로 변환
	    ObjectMapper mapper = new ObjectMapper();
	    String calendarJsonList = mapper.writeValueAsString(calenderList);
	    model.addAttribute("calendarList", calendarJsonList);
	    System.out.println(calendarJsonList);
		
		return "/calender/calenderView";
	}
	
	@ResponseBody
	@RequestMapping("/calenderAdd")
	public CalenderVO calenderAdd(@RequestBody CalenderVO vo) throws Exception {
		
		System.out.println(vo);
		
		calenderService.calenderAdd(vo);
		
		return vo;
	}
	
	@ResponseBody
	@RequestMapping("/calenderUpdate")
	public CalenderVO calenderUpdate(@RequestBody CalenderVO vo) throws Exception {
		
		System.out.println(vo);
		
		calenderService.calenderUpdate(vo);
		
		return vo;
	}
	
	@ResponseBody
	@RequestMapping("/calenderDel")
	public CalenderVO calenderDel(@RequestBody CalenderVO vo) throws Exception {
		System.out.println(vo);
		
		calenderService.calenderDel(vo);
		
		return vo;
	}
}