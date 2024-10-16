package com.ugi.durimoa.member.dao;

import org.apache.ibatis.annotations.Mapper;
import com.ugi.durimoa.member.vo.MemberVO;
import com.ugi.durimoa.member.vo.CoupleVO;

// Mybatis에서 Mapper 인터페이스임을 나타내는 어노테이션
// SQL 쿼리와 Java 객체 간의 매핑을 자동으로 처리함
// mapper에 namespace와 매핑됨
@Mapper	
public interface IMemberDAO {
	
	// 회원 가입
	public int registMember(MemberVO vo);
	
	// 일반 로그인
	public MemberVO loginMember(MemberVO vo);
	
	// 회원 정보 수정
	public void updateMember(MemberVO vo);
	
	// 아이디 중복 체크
	public int idCheck(String id);
	
	// 커플 검색
	public MemberVO coupleck(String id);
	
	// 커플 생성
	public int coupleAdd(CoupleVO vo);
	
	// 커플 ID 불러오기
		public int coupleId(String id);
	
	// 커플 ID 멤버에 저장
	public void updateCop(MemberVO vo);
}
