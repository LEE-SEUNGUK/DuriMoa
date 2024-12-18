package com.ugi.durimoa.member.web;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.support.DaoSupport;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.ugi.durimoa.member.service.MemberService;
import com.ugi.durimoa.member.vo.MemberVO;
import com.ugi.durimoa.member.vo.RequestVO;
import com.ugi.durimoa.member.vo.CoupleInfoVO;
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

		if (req_cnt == 1) {
			System.out.println("커플 요청 대기 세션");
			RequestVO req = memberService.reqInfo(login.getMemId());
			session.setAttribute("req", req);
		}

		int res_cnt = memberService.ResWait(login.getMemId());
		if (res_cnt == 1) {
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

		// 입력한 비밀번호와 db의 암호화된 비번을 비교해서 일치하면 true, 그렇지 않으면 false 반환

		System.out.println("로그인 세션: " + login);

		session.setAttribute("login", login);

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

	@ResponseBody
	@RequestMapping("/coupleAdd")
	public ResponseEntity<?> updateCop(@RequestBody CoupleVO vo, HttpSession session,
			@RequestParam("memId") String cop_memId, HttpServletResponse response) throws Exception {
		// 세션에 있는 값을 가져올땐 객체에 담아서 메소드로 가져온다.
		MemberVO login = (MemberVO) session.getAttribute("login");
		String login_memId = login.getMemId();

		MemberVO mem = memberService.coupleck(cop_memId);
		if ("Y".equals(mem.getCopYn())) {
			return new ResponseEntity<>("success", HttpStatus.OK);
		}

		int req_num = memberService.ResWait(cop_memId);
		if (req_num == 1) {
			return new ResponseEntity<>(HttpStatus.OK);
		}

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

		return new ResponseEntity<>(vo, HttpStatus.OK);
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
		MemberVO vo = (MemberVO) session.getAttribute("login");
		CoupleInfoVO cop = (CoupleInfoVO) session.getAttribute("couple");

		if (cop != null) {
			session.removeAttribute("couple");
			int copId = cop.getCopId();
			memberService.removeReq(copId);
			memberService.memCoupleDel(copId);
			memberService.delCouple(copId);
		} else {
			memberService.exitCopReq(vo.getMemId());
		}

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
	@RequestMapping("/updateDo")
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

		System.out.println(mem);

		if ("Y".equals(mem.getCopYn())) {
			vo.setCopId(mem.getCopId());
			vo.setCopYn("Y");
		};
		vo.setKkoYn("N");
		
		memberService.updateMember(vo);

		session.setAttribute("login", vo);
		System.out.println(vo);
		return vo;
	}

	@RequestMapping("/myPageView")
	public String MyPageView() {

		return "/member/myPageView";
	}

	@RequestMapping(value = "/login/getKakaoAuthUrl")
	public @ResponseBody String getKakaoAuthUrl(HttpServletRequest request) throws Exception {
		String reqUrl = "https://kauth.kakao.com/oauth/authorize" + "?client_id=9d407e93fbddd6bd9146ab8e8274441c"
				+ "&redirect_uri=http://localhost:8080/login/oauth_kakao" + "&response_type=code";

		return reqUrl;
	}

	// 카카오 연동정보 조회
	@RequestMapping(value = "/login/oauth_kakao")
	public String oauthKakao(@RequestParam(value = "code", required = false) String code, Model model, HttpSession session)
			throws Exception {

		System.out.println("#########" + code);
		String access_Token = getAccessToken(code);
		System.out.println("###access_Token#### : " + access_Token);

		HashMap<String, Object> userInfo = getUserInfo(access_Token);
		System.out.println("###access_Token#### : " + access_Token);
		System.out.println("userInfo: " + userInfo.get("email"));
		System.out.println("nickname: " + userInfo.get("nickname"));
		System.out.println("profile_Img: " + userInfo.get("profileImg"));

		// 카카오 로그인 정보 MemberVO에 매핑
	    MemberVO vo = new MemberVO();
	    vo.setMemId((String) userInfo.get("email"));
	    vo.setMemPw((String) userInfo.get("email"));
	    vo.setMemNm((String) userInfo.get("nickname"));
	    vo.setMemImg((String) userInfo.get("profileImg"));

	    // 회원가입 서비스 호출
	    if(memberService.idCheck(vo.getMemId()) == 0) {
		    memberService.registMember(vo);
	    }	    
	    
	    memberService.useKakao((String) userInfo.get("email"));
	    MemberVO login = memberService.loginMember(vo);
	    
	    int req_cnt = memberService.ReqWait(login.getMemId());

		if (req_cnt == 1) {
			System.out.println("커플 요청 대기 세션");
			RequestVO req = memberService.reqInfo(login.getMemId());
			session.setAttribute("req", req);
		}

		int res_cnt = memberService.ResWait(login.getMemId());
		if (res_cnt == 1) {
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
	    
	    session.setAttribute("login", login);
	    session.setAttribute("token", access_Token);
	    
		return "redirect: /"; // 본인 원하는 경로 설정
	}
	
	@RequestMapping("/logoutKko")
	public String logoutKko(HttpSession session){
		String client_id = "9d407e93fbddd6bd9146ab8e8274441c";  // 앱 키
	    String logout_redirect_uri = "http://localhost:8080/";    // 로그아웃 후 리다이렉트할 URI
	    
	    // 세션 정리
	    session.invalidate();
	    
	    // 카카오 계정 로그아웃 처리 후 리다이렉트
	    return "redirect:https://kauth.kakao.com/oauth/logout?client_id=" + client_id + 
	           "&logout_redirect_uri=" + logout_redirect_uri;
	}
	
	@RequestMapping("/unlinkKakao")
	public String unlinkKakao(HttpSession session) {
	    String reqURL = "https://kapi.kakao.com/v1/user/unlink";
	    String access_Token = (String) session.getAttribute("token");
	    
	    try {
	        // 카카오 연결끊기 API 호출
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);

	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);

	        if(responseCode == 200) {
	        	MemberVO vo = (MemberVO) session.getAttribute("login");
	    		CoupleInfoVO cop = (CoupleInfoVO) session.getAttribute("couple");

	    		if (cop != null) {
	    			session.removeAttribute("couple");
	    			int copId = cop.getCopId();
	    			memberService.removeReq(copId);
	    			memberService.memCoupleDel(copId);
	    			memberService.delCouple(copId);
	    		} else {
	    			memberService.exitCopReq(vo.getMemId());
	    		}

	    		memberService.exit(vo.getMemId());
	    		session.removeAttribute("login");
	            
	            return "redirect:/";
	        }
	        
	        // 응답 확인을 위한 로그
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        String line = "";
	        StringBuilder result = new StringBuilder();
	        while ((line = br.readLine()) != null) {
	            result.append(line);
	        }
	        System.out.println("response body : " + result.toString());
	        
	        br.close();
	        conn.disconnect();
	        
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    
	    // 실패시 에러페이지로 이동
	    return "redirect: /error";
	}

	// 토큰발급
	public String getAccessToken(String authorize_code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			// URL연결은 입출력에 사용 될 수 있고, POST 혹은 PUT 요청을 하려면 setDoOutput을 true로 설정해야함.
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=9d407e93fbddd6bd9146ab8e8274441c"); // 본인이 발급받은 key
			sb.append("&redirect_uri=http://localhost:8080/login/oauth_kakao"); // 본인이 설정해 놓은 경로
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();

			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);

			br.close();
			bw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return access_Token;
	}

	// 유저정보조회
	public HashMap<String, Object> getUserInfo(String access_Token) {

		// 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();
			String profileImageUrl = properties.get("profile_image").getAsString();

			userInfo.put("accessToken", access_Token);
			userInfo.put("nickname", nickname);
			userInfo.put("email", email);
			userInfo.put("profileImg", profileImageUrl);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return userInfo;
	}

}