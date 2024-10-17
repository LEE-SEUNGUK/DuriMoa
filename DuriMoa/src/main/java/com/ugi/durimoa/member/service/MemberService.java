package com.ugi.durimoa.member.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import org.slf4j.Logger; // 로깅을 위한 의존성 추가
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ugi.durimoa.member.dao.IMemberDAO;
import com.ugi.durimoa.member.vo.CoupleInfoVO;
import com.ugi.durimoa.member.vo.CoupleVO;
import com.ugi.durimoa.member.vo.MemberVO;

@Service // 비즈니스 로직을 처리하는 계층
public class MemberService {

	// SLF4J를 사용한 로깅
	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);

	@Autowired // 의존성 주입
	IMemberDAO dao;

	public MemberVO loginMember(MemberVO vo) throws Exception {

		MemberVO user = dao.loginMember(vo);
		if (user == null) {
			System.out.println("올바르지 않은 계정 정보");
			return null;
		}
		return user;
	}

	public void registMember(MemberVO vo) throws Exception {
		System.out.println("registMember");

		int result = dao.registMember(vo);

		if (result == 0) {
			throw new Exception();
		}
	}

	public String getAccessToken(String authorize_code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");

			sb.append("&client_id=0610e7969f3304f9ba45d87f91195c2c"); // 본인이 발급받은 key
			sb.append("&redirect_uri=http://localhost:8080/kakao"); // 본인이 설정한 주소

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
			e.printStackTrace();
		}
		return access_Token;
	}

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
			String profileImg = properties.getAsJsonObject().get("profile_image").getAsString();

			userInfo.put("nickname", nickname);
			userInfo.put("email", email);
			userInfo.put("profileImg", profileImg);

		} catch (IOException e) {
			e.printStackTrace();
		}
		return userInfo;
	}

	public void updateMember(MemberVO vo) {
		dao.updateMember(vo);
	}

	public int idCheck(String id) {
		int cnt = dao.idCheck(id);
		System.out.println("cnt: " + cnt);
		return cnt;
	}

	public MemberVO coupleck(String id) {
		MemberVO user = dao.coupleck(id);
		System.out.println(user);
		return user;
	}

	public int coupleAdd(CoupleVO vo) throws Exception {	
		return dao.coupleAdd(vo);
	}

	public void updateCop(MemberVO vo) throws Exception {
		System.out.println("멤버에 커플 ID 저장");

		dao.updateCop(vo);
	}
	
	public CoupleInfoVO copSession(MemberVO vo) {
		System.out.println("커플 세션 추가 서비스");
		
		CoupleInfoVO cop_s = dao.copSession(vo);
		
		return cop_s;
	};
}
