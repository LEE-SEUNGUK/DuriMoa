package com.ugi.durimoa.member.web;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
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
	
	@Value("${file.upload.path}")
    private String uploadPath;

	@Autowired
	private ServletContext servletContext;
	
	@RequestMapping("/registDo")
	@ResponseBody
	public String registDo(@ModelAttribute MemberVO vo, @RequestParam("profileImage") MultipartFile file) {
	    try {
	        if (!file.isEmpty()) {
	            String realPath = servletContext.getRealPath("/resources/assets/uploads/");
	            String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
	            String filePath = realPath + fileName;

	            File dest = new File(filePath);

	            // 파일 저장
	            file.transferTo(dest);
	            
	            // DB에 저장할 경로 설정 (웹에서 접근 가능한 경로로 설정)
	            vo.setMemImg("/resources/assets/profiles/" + fileName);
	        }

	        memberService.registMember(vo);

	    } catch (Exception e) {
	        e.printStackTrace();
	        return "error";
	    }
	    return "success";
	}


	@RequestMapping("/loginDo")
	public String loginDo(MemberVO vo) throws Exception {
		System.out.println(vo);

		MemberVO login = memberService.loginMember(vo);

		System.out.println(login);
		// 입력한 비밀번호와 db의 암호화된 비번을 비교해서 일치하면 true, 그렇지 않으면 false 반환
		if (login == null) {
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