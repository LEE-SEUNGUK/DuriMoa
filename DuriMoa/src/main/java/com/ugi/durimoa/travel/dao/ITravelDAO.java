package com.ugi.durimoa.travel.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.ugi.durimoa.member.vo.MemberVO;
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
}
