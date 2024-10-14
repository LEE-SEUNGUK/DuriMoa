package com.ugi.durimoa.member.dao;

import org.apache.ibatis.annotations.Mapper;
import com.ugi.durimoa.member.vo.MemberVO;

// Mybatis에서 Mapper 인터페이스임을 나타내는 어노테이션
// SQL 쿼리와 Java 객체 간의 매핑을 자동으로 처리함
// mapper에 namespace와 매핑됨
@Mapper	
public interface IMemberDAO {
	
	// 회원 가입
	public int registMember(MemberVO vo);
	
	// 일반 로그인
	public MemberVO loginMember(MemberVO vo);
	
}
