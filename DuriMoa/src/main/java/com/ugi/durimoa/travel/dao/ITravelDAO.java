package com.ugi.durimoa.travel.dao;

import org.apache.ibatis.annotations.Mapper;

import com.ugi.durimoa.travel.vo.ImageVO;
import com.ugi.durimoa.travel.vo.TravelVO;

@Mapper
public interface ITravelDAO {

	// 여행 추가
	public int travelAdd(TravelVO vo);
	
}
