package com.ugi.durimoa.member.service;

import org.slf4j.Logger; // 로깅을 위한 의존성 추가
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ugi.durimoa.member.dao.IMemberDAO;
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
			throw new Exception();
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
}
