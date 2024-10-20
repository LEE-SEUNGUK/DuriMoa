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
import org.springframework.web.bind.annotation.GetMapping;
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
import com.ugi.durimoa.member.vo.RequestVO;
import com.ugi.durimoa.member.vo.CoupleInfoVO;
import com.ugi.durimoa.member.vo.CoupleVO;

@Controller
public class MemberController {

	int cop_id = 1;

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

	// 아이디 중복체크
	@PostMapping("/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) {

		int cnt = memberService.idCheck(id);
		return cnt;
	}

	@RequestMapping("/loginDo")
	@ResponseBody // 이 부분 추가해서 JSON 형식으로 응답하도록 함
	public HashMap<String, String> loginDo(@RequestBody MemberVO vo, boolean remember, HttpSession session,
			HttpServletResponse response) throws Exception {
		HashMap<String, String> result = new HashMap<>();
		System.out.println(vo);

		MemberVO login = memberService.loginMember(vo);

		int req_cnt = memberService.ReqWait(login.getMemId());
		
		if(req_cnt == 1) {
			System.out.println("커플 요청 대기 세션");
			RequestVO req = memberService.reqInfo(login.getMemId());
			session.setAttribute("req", req);
		}
		
		int res_cnt = memberService.ResWait(login.getMemId());
		if(res_cnt == 1) {
			System.out.println("커플 요청 응답 세션");
			RequestVO res = memberService.reqInfo(login.getMemId());
			session.setAttribute("res", res);
			System.out.println("요청응답 있음");
		}
		
		System.out.println(login.getCopYn());
		if ("Y".equals(login.getCopYn())) {
			CoupleInfoVO couple = memberService.copSession(login);
			System.out.println("커플 세션 등록");
			session.setAttribute("couple", couple);
		}

		System.out.println(login);
		// 입력한 비밀번호와 db의 암호화된 비번을 비교해서 일치하면 true, 그렇지 않으면 false 반환

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

		System.out.println(login);

		result.put("status", "success");
		return result;
	}

	@ResponseBody
	@RequestMapping("/coupleAdd")
	public RequestVO updateCop(@RequestBody CoupleVO vo, HttpSession session, @RequestParam("memId") String cop_memId,
			HttpServletResponse response) throws Exception {
		// 세션에 있는 값을 가져올땐 객체에 담아서 메소드로 가져온다.
		MemberVO login = (MemberVO) session.getAttribute("login");
		String login_memId = login.getMemId();

		memberService.coupleAdd(vo); // 자동 생성된 copId 반환
		System.out.println("커플 ID: " + vo.getCopId());
		
		RequestVO req_send = new RequestVO();
		req_send.setReqCid(vo.getCopId());
		req_send.setReqMid(login_memId);
		req_send.setResMid(cop_memId);
		
		// 요청 보내기! 잘 가는지 확인
		memberService.coupleReq(req_send);
		
		RequestVO req = memberService.reqInfo(login.getMemId());
		session.setAttribute("req", req);

		return req;
	}
	
	@RequestMapping("/allowReq")
	public String allowReq(HttpSession session) {
		MemberVO login = (MemberVO) session.getAttribute("login");
		String login_memId = login.getMemId();
		memberService.allowReq(login_memId);
		
		System.out.println("요청 수락 컨트롤러");
		
		memberService.allowCouple(login_memId);
		memberService.memCouple(login_memId);
		CoupleInfoVO couple = memberService.copSession(login);
		System.out.println("커플 세션 등록");
		session.setAttribute("couple", couple);
		session.removeAttribute("res");
		
		return "/member/myPageView";
	}
	
	@RequestMapping("/opposeReq")
	public String opposeReq(HttpSession session) {
		MemberVO login = (MemberVO) session.getAttribute("login");
		String login_memId = login.getMemId();
		memberService.opposeReq(login_memId);
		
		System.out.println("요청 거절 컨트롤러");
		
		session.removeAttribute("res");
		
		return "/member/myPageView";
	};


	@RequestMapping("/coupleUpdate")
	@ResponseBody
	public CoupleInfoVO copUpdate(@RequestBody CoupleVO vo, HttpSession session) {

		System.out.println("커플 업데이트 컨트롤");
		System.out.println("수정 값: " + vo);

		memberService.copUpdate(vo);

		CoupleInfoVO cop = (CoupleInfoVO) session.getAttribute("couple");
		System.out.println("현재 커플세션: " + cop);

		cop.setCopNm(vo.getCopNm());
		cop.setCopDt(vo.getCopDt());

		System.out.println("수정된 커플세션: " + cop);
		session.setAttribute("couple", cop);

		return cop;
	}
	
	@RequestMapping("/coupleDelete")
	public String copDelete(HttpSession session) {
		System.out.println("커플 삭제 컨트롤러");
			
		CoupleInfoVO cop = (CoupleInfoVO) session.getAttribute("couple");
		int copId = cop.getCopId();
		
		memberService.removeReq(copId);
		memberService.memCoupleDel(copId);
		memberService.delCouple(copId);
		
		session.removeAttribute("couple");
		return "/member/myPageView";
	}
	
	@RequestMapping("/delReqCop")
	public String delReqCop(HttpSession session) {
		
		MemberVO vo = (MemberVO) session.getAttribute("login");
		
		memberService.delReqCop(vo.getMemId());
		session.removeAttribute("req");
		
		return "/member/myPageView";
	}

	@RequestMapping("/logoutDo")
	public String logout(HttpSession session) throws Exception {

		session.invalidate();

		return "redirect:/";
	}
	
	@RequestMapping("/exit")
	public String exit(HttpSession session) {
		
		CoupleInfoVO cop = (CoupleInfoVO) session.getAttribute("couple");
		
		if(cop != null) {
			session.removeAttribute("couple");
			int copId = cop.getCopId();
			memberService.removeReq(copId);
			memberService.memCoupleDel(copId);
			memberService.delCouple(copId);
		}
		
		MemberVO vo = (MemberVO) session.getAttribute("login");
		
		memberService.exit(vo.getMemId());
		session.removeAttribute("login");
	
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
			@RequestParam(value = "profileImage", required = false) MultipartFile file, HttpServletRequest request,
			HttpSession session) throws IOException {

		if (file != null && !file.isEmpty()) {
			String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
			String filePath = uploadPath + File.separator + fileName;
			File dest = new File(filePath);
			file.transferTo(dest);
			vo.setMemImg(downloadPath + fileName);
		}
		
		MemberVO mem = (MemberVO) session.getAttribute("login");
		
		System.out.println(vo);

		
		if("Y".equals(mem.getCopYn())) {
			vo.setCopId(mem.getCopId());
			vo.setCopYn("Y");
		};

		memberService.updateMember(vo);
		
		session.setAttribute("login", vo);

		return vo;
	}

	@RequestMapping("/myPageView")
	public String MyPageView() {

		return "/member/myPageView";
	}
	
}