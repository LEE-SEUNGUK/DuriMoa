package com.ugi.durimoa.member.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ugi.durimoa.member.service.MemberService;
import com.ugi.durimoa.member.vo.MemberVO;
import com.ugi.durimoa.member.vo.CoupleVO;

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
	
	//아이디 중복체크
	@PostMapping("/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) {
		
		int cnt = memberService.idCheck(id);
		return cnt;
	}
	
	@RequestMapping("/loginDo")
	@ResponseBody // 이 부분 추가해서 JSON 형식으로 응답하도록 함
	public HashMap<String, String> loginDo(@RequestBody MemberVO vo, boolean remember, HttpSession session, HttpServletResponse response)
			throws Exception {
		HashMap<String, String> result = new HashMap<>();
		System.out.println(vo);

		MemberVO login = memberService.loginMember(vo);

		System.out.println(login);
		// 입력한 비밀번호와 db의 암호화된 비번을 비교해서 일치하면 true, 그렇지 않으면 false 반환
		if (login == null) {
			result.put("status", "fail");
			result.put("message", "아이디 또는 비밀번호가 잘못되었습니다.");
			return result;
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

		 result.put("status", "success");
		 return result;
	}


	@RequestMapping("/coupleAdd")
	@ResponseBody // 이 부분 추가해서 JSON 형식으로 응답하도록 함
	public String updateCop(@RequestBody CoupleVO vo, HttpSession session, HttpServletResponse response)
			throws Exception {
		// 세션에 있는 값을 가져올땐 객체에 담아서 메소드로 가져온다.
		MemberVO login = (MemberVO) session.getAttribute("login");

		memberService.coupleAdd(vo);
		String memId = vo.getMemId();
		int copId = memberService.coupleId(memId);
		
		String mem1Id = login.getMemId();
		String mem2Id = vo.getMemId();
		
		MemberVO mem1 = new MemberVO();
		MemberVO mem2 = new MemberVO();
		
		mem1.setCopId(copId);
		mem2.setCopId(copId);
		
		mem1.setMemId(mem1Id);
		mem2.setMemId(mem2Id);
		
		memberService.updateCop(mem1);
		memberService.updateCop(mem2);

		return "success";
	}

	@RequestMapping("/logoutDo")
	public String logout(HttpSession session) throws Exception {

		session.invalidate();

		return "redirect:/";
	}
	
	@RequestMapping("/coupleCk")
	@ResponseBody
	public MemberVO coupleCk(@RequestParam("id") String id) {
		
		MemberVO mem = memberService.coupleck(id);
		
		return mem;
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

	@ResponseBody
	@PostMapping("/updateDo")
	public MemberVO updateMember(@ModelAttribute MemberVO vo, 
	                             @RequestParam(value = "profileImage", required = false) MultipartFile file,
	                             HttpServletRequest request) throws IOException {

		 if (file != null && !file.isEmpty()) {
		        String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
		        String filePath = uploadPath + File.separator + fileName;
		        File dest = new File(filePath);
		        file.transferTo(dest);
		        vo.setMemImg(downloadPath + fileName);
		    }

		    memberService.updateMember(vo);

		    HttpSession session = request.getSession();
		    session.setAttribute("login", vo);

		    return vo;
	}

	@RequestMapping("/myPageView")
	public String MyPageView() {

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