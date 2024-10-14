package com.ugi.durimoa.member.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ugi.durimoa.member.service.MemberService;
import com.ugi.durimoa.member.vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;

	@Value("#{util['file.upload.path']}")
	private String uploadPath;

	@Value("#{util['file.download.path']}")
	private String downloadPath;

	// 지금 경로가 안먹음(직접 작성해야 됨)
	@RequestMapping("/registDo")
	@ResponseBody
	public String registDo(@ModelAttribute MemberVO vo, @RequestParam("profileImage") MultipartFile file)
			throws Exception {
		try {
			if (!file.isEmpty()) {
				String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
				String filePath = uploadPath + File.separator + fileName; // 업로드 경로

				System.out.println(filePath);

				File dest = new File(filePath);

				// 파일 저장
				file.transferTo(dest);
				System.out.println("File saved at: " + filePath);

				// DB에 경로 저장 (전체 경로 형식)
				vo.setMemImg(downloadPath + fileName); // URL 형식으로 저장
			}

			memberService.registMember(vo);
		} catch (IOException e) {
			e.printStackTrace();
			return "File saving error: " + e.getMessage();
		}
		return "success";
	}

	@RequestMapping("/loginDo")
	public String loginDo(MemberVO vo, boolean remember, HttpSession session, HttpServletResponse response)
			throws Exception {
		System.out.println(vo);

		MemberVO login = memberService.loginMember(vo);

		System.out.println(login);
		// 입력한 비밀번호와 db의 암호화된 비번을 비교해서 일치하면 true, 그렇지 않으면 false 반환
		if (login == null) {
			System.out.println("로그인 실패");
		}

		System.out.println("로그인 성공");

		session.setAttribute("login", login);
		System.out.println(login);
		if (remember) {
			// 쿠키 생성
			Cookie cookie = new Cookie("rememberId", login.getMemId());
			response.addCookie(cookie);

		} else {
			// 쿠키 삭제
			// 동일한 key 값을 가지는 쿠키의 유효시간을 0으로
			Cookie cookie = new Cookie("rememberId", "");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}

		return "redirect:/";
	}

	@RequestMapping("/download")
	public void download(String imageFileName, HttpServletResponse response) throws IOException {
		OutputStream out = response.getOutputStream();
		String downloadFile = uploadPath + "\\" + imageFileName;

		File file = new File(downloadFile);

		// 로컬에서 요청 파일을 찾아서 전달
		if (!file.exists()) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND, "file not found");
		}
		// 로컬에서 요청 파일을 찾아서 전달
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Content-Disposition", "attachment; fileName=" + imageFileName);

		try (FileInputStream in = new FileInputStream(file)) {
			byte[] buffer = new byte[1024 * 8];
			while (true) {
				int count = in.read(buffer);
				if (count == -1) {
					break;
				}
				out.write(buffer, 0, count); // 실시간 전송
			}
		} catch (IOException e) {

		} finally {
			out.close();
		}
	}
	
	@RequestMapping("/myPageView")
	public String MyPageView() {
		System.out.println("MyPageView");
		
		return "/member/myPageView";
	}

	@RequestMapping(value = "/kakao", method = RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Exception {
		System.out.println("#########" + code);

		// 위에서 만든 코드 아래에 코드 추가
		String access_Token = memberService.getAccessToken(code);
		System.out.println("###access_Token#### : " + access_Token);
		

		// 위에서 만든 코드 아래에 코드 추가
		HashMap<String, Object> userInfo = memberService.getUserInfo(access_Token);
		System.out.println("###access_Token#### : " + access_Token);
		System.out.println("###nickname#### : " + userInfo.get("nickname"));
		System.out.println("###email#### : " + userInfo.get("email"));
		System.out.println("###email#### : " + userInfo.get("profileImg"));
		
		return "member/testPage";
	}

}