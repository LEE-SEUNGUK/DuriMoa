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
import com.ugi.durimoa.member.vo.RequestVO;

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

	public void coupleAdd(CoupleVO vo) throws Exception {
		dao.coupleAdd(vo);
	}

	public void coupleReq(RequestVO vo) {
		dao.coupleReq(vo);
	};

	public int ReqWait(String memId) {
		System.out.println("수락  대기");
		int cnt = dao.ReqWait(memId);

		return cnt;
	};

	public int ResWait(String memId) {
		System.out.println("응답 대기");
		int cnt = dao.ResWait(memId);

		return cnt;
	};

	public RequestVO reqInfo(String memId) {
		System.out.println("상대 정보 보여주기 service");

		RequestVO vo = dao.reqInfo(memId);

		return vo;
	};

	public void allowReq(String memId) {
		System.out.println("응답 수락 서비스");

		dao.allowReq(memId);
	};

	public void opposeReq(String memId) {
		System.out.println("응답 거절 서비스");

		dao.opposeReq(memId);
	};

	public void allowCouple(String memId) {
		System.out.println("커플 사용 시작!");

		dao.allowCouple(memId);
	};

	public void memCouple(String memId) {
		System.out.println("멤버에 커플 ID 등록 완료");

		dao.memCouple(memId);
	};

	public CoupleInfoVO copSession(MemberVO vo) {
		System.out.println("커플 세션 추가 서비스");

		CoupleInfoVO cop_s = dao.copSession(vo);

		return cop_s;
	};

	public void copUpdate(CoupleVO vo) {
		System.out.println("커플 변경 서비스");

		dao.copUpdate(vo);
	};

	public void removeReq(int copId) {
		dao.removeReq(copId);
	};

	// member 테이블 외래키 해제
	public void memCoupleDel(int copId) {
		dao.memCoupleDel(copId);
	};

	// 해당 커플 삭제
	public void delCouple(int copId) {
		dao.delCouple(copId);
	};
	
	// 커플 요청 취소
	public void delReqCop(String memId) {
		dao.delReqCop(memId);
	};
	
	public void exitCopReq(String memId) {
		dao.exitCopReq(memId);
	}
	
	// 회원 탈퇴
	public void exit(String memId) {
		dao.exit(memId);
	}
	
	// 카카오 사용 여부
	public void useKakao(String memId) {
		dao.useKakao(memId);
	}
}
