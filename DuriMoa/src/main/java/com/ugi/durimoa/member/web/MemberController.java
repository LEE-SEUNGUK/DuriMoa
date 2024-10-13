package com.ugi.durimoa.member.web;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	@Value("${file.download.path}")
    private String downloadPath;
	
	// 지금 경로가 안먹음(직접 작성해야 됨)
	@RequestMapping("/registDo")
	@ResponseBody
	public String registDo(@ModelAttribute MemberVO vo, @RequestParam("profileImage") MultipartFile file) throws Exception {
	    try {
	        if (!file.isEmpty()) {
	            String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
	            String filePath = "C:\\DuriMoa_profile" + File.separator + fileName; // 업로드 경로

	            System.out.println(filePath);
	            
	            File dest = new File(filePath);
	         
	            // 파일 저장
	            file.transferTo(dest);
	            System.out.println("File saved at: " + filePath);

	            // DB에 경로 저장 (전체 경로 형식)
	            vo.setMemImg("/download?imageFileName=" + fileName);  // URL 형식으로 저장
	        }

	        memberService.registMember(vo);
	    } catch (IOException e) {
	        e.printStackTrace();
	        return "File saving error: " + e.getMessage();
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