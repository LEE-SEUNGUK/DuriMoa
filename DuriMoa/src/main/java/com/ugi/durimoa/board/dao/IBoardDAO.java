package com.ugi.durimoa.board.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.ugi.durimoa.board.vo.BoardInfoVO;
import com.ugi.durimoa.board.vo.BoardVO;
import com.ugi.durimoa.board.vo.ReplyVO;
import com.ugi.durimoa.member.vo.MemberVO;
import com.ugi.durimoa.travel.vo.TravelInfoVO;

@Mapper
public interface IBoardDAO {

	
	public int boardAdd(BoardVO vo);
	
	// 게시글 전체 조회
	public ArrayList<BoardInfoVO> getBoardList();
	
	// 게시글 검색
	public ArrayList<BoardInfoVO> getBoardSearch(String kerWord);
	
	// 내 게시글 조회
	public ArrayList<BoardInfoVO> myBoard(String memId);
	
	// 게시글 상세 조회
	public BoardInfoVO getBoard(int brdId);
	
	// 댓글 작성
	public int writeReply(ReplyVO vo);
	
	// 단일 댓글 조회
	public ReplyVO getReply (String rpyId);
	
	// 전체 댓글 조회
	public ArrayList<ReplyVO> getReplyList(int brdId);
	
	// 댓글 삭제
	public int delReply(String rpyId);
	
	// 댓글 갯수
	public int cntReply(int brdId);
}
