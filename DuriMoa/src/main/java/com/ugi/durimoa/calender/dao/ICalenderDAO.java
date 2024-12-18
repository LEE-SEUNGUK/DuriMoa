package com.ugi.durimoa.calender.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.ugi.durimoa.calender.vo.CalenderVO;

@Mapper
public interface ICalenderDAO {

	public void calenderAdd(CalenderVO vo);
	
	// 전체 일정 조회
	public ArrayList<CalenderVO> calenderShow(String memId);
	
	// 일정 수정
	public void calenderUpdate(CalenderVO vo);
	
	// 일정 삭제
	public void calenderDel(CalenderVO vo);
}
