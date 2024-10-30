package com.ugi.durimoa.board.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.ugi.durimoa.board.vo.BoardInfoVO;
import com.ugi.durimoa.board.vo.BoardVO;
import com.ugi.durimoa.board.vo.LikeVO;
import com.ugi.durimoa.board.vo.ReplyVO;
import com.ugi.durimoa.member.vo.MemberVO;
import com.ugi.durimoa.travel.vo.SearchVO;
import com.ugi.durimoa.travel.vo.TravelInfoVO;

@Mapper
public interface IBoardDAO {

	
	public int boardAdd(BoardVO vo);
	
	// 게시글 전체 조회
	public ArrayList<BoardInfoVO> getBoardList();
	
	// 게시글 검색
	public ArrayList<BoardInfoVO> getBoardSearch(String kerWord);
	
	// 게시글 수정
	public int boardUpdate(BoardVO vo);
	
	// 내 게시글 검색
	public ArrayList<BoardInfoVO> getMyBoardSearch(SearchVO vo);
	
	// 내 게시글 조회
	public ArrayList<BoardInfoVO> myBoard(String memId);
	
	// 게시글 상세 조회
	public BoardInfoVO getBoard(int brdId);
	
	// 게시글 삭제
	public void boardDel(int brdId);
	
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
	
	// 좋아요 갯수
	public int likesCnt(int brdId);
	
	// 좋아요 체크
	public int likeCk(LikeVO vo);
	
	public void likeAdd(LikeVO vo);
	
	public void likeDel(LikeVO vo);
}
