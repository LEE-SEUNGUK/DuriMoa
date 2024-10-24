package com.ugi.durimoa.travel.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.ugi.durimoa.member.vo.MemberVO;
import com.ugi.durimoa.travel.vo.SearchVO;
import com.ugi.durimoa.travel.vo.TravelInfoVO;
import com.ugi.durimoa.travel.vo.TravelVO;

@Mapper
public interface ITravelDAO {

	// 여행 추가
	public int travelAdd(TravelVO vo);
	
	// 여행 전체 조회
	public ArrayList<TravelInfoVO> getTravelList(MemberVO vo);
	
	// 수정할 여행 정보 조회
	public TravelInfoVO getTravel(int trvId);
	
	// 여행 정보 수정
	public int travelUpdate(TravelVO vo);
	
	// 여행 삭제
	public void travelDel(int trvId);
	
	// 여행 검색(위치, 제목)
	public ArrayList<TravelInfoVO> getTravelSearch(SearchVO vo);
	
}
