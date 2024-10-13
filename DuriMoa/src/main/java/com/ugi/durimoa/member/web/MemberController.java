package com.ugi.durimoa.member.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.remoting.soap.SoapFaultException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ugi.durimoa.member.service.MemberService;
import com.ugi.durimoa.member.vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;

//	@RequestMapping("/registView") // 요청 url
//	public String registView() {
//
//		return "member/registView";
//	}

	@RequestMapping("/registDo")
	@ResponseBody
	public String registDo(MemberVO vo) {

		System.out.println(vo);

		try {
			memberService.registMember(vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "success";
	}

//	@RequestMapping("/loginView") // 요청 url
//	public String loginView() {
//
//		return "member/loginView";
//	}

	@RequestMapping("/loginDo")
	public String loginDo(MemberVO vo)
			throws Exception {
		System.out.println("do는 타니?");
		System.out.println(vo);
		
		MemberVO login = memberService.loginMember(vo);

		System.out.println(login);
		// 입력한 비밀번호와 db의 암호화된 비번을 비교해서 일치하면 true, 그렇지 않으면 false 반환
		if (login == null ) {
			System.out.println("로그인 실패");
		}

		System.out.println("로그인 성공");

		return "redirect:/";
	}

//	@RequestMapping("/logoutDo")
//	public String logout(HttpSession session) throws Exception {
//
//		session.invalidate();
//
//		return "redirect:/";
//	}
//
//	@RequestMapping("/mypage")
//	public String mypage(HttpSession session, Model model) {
//
//
//		if (session.getAttribute("login") == null) {
//			return "redirect:/loginView";
//		}
//
//		return "redirect:/";
//	}

}