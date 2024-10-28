package com.ugi.durimoa.board.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.ugi.durimoa.board.vo.BoardInfoVO;
import com.ugi.durimoa.board.vo.BoardVO;
import com.ugi.durimoa.member.vo.MemberVO;
import com.ugi.durimoa.travel.vo.TravelInfoVO;

@Mapper
public interface IBoardDAO {

	
	public int boardAdd(BoardVO vo);
	
	// 게시글 전체 조회
	public ArrayList<BoardInfoVO> getBoardList();
}
