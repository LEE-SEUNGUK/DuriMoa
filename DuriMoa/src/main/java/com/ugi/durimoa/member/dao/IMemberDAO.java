package com.ugi.durimoa.member.dao;

import org.apache.ibatis.annotations.Mapper;
import com.ugi.durimoa.member.vo.MemberVO;
import com.ugi.durimoa.member.vo.RequestVO;
import com.ugi.durimoa.member.vo.CoupleInfoVO;
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
	
	// 커플 요청 보내기
	public void coupleReq(RequestVO vo);
	
	// 수락 대기
	public int ReqWait(String memId);

	// 응답 대기
	public int ResWait(String memId);
	
	// 커플 요청 정보 보여주기
	public RequestVO reqInfo(String memId);
	
	// 응답 수락
	public void allowReq(String memId);
	
	// 응답 거절
	public void opposeReq(String memId);
	
	// 커플 조인
	public void allowCouple(String memId);
	
	// 커플 ID 멤버에 저장
	public void memCouple(String memId);
	
	// 커플 정보 세션에 등록
	public CoupleInfoVO copSession(MemberVO vo);
	
	// 커플 정보 업데이트	
	public void copUpdate(CoupleVO vo);
	
	// 커플 요청 삭제
	public void removeReq(int copId);
	
	// member 테이블 외래키 해제
	public void memCoupleDel(int copId);
	
	// 해당 커플 삭제
	public void delCouple(int copId);
	
	// 커플 요청 삭제
	public void delReqCop(String memId);
	
	// 커플 요청 하거나 받은 상태로 탈퇴시 강제 요청 삭제
	public void exitCopReq(String memId);
	
	// 회원 탈퇴
	public void exit(String memId);
	
	// 카카오 사용 여부
	public void useKakao(String memId);
}