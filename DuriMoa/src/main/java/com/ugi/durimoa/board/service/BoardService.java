package com.ugi.durimoa.board.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ugi.durimoa.board.dao.IBoardDAO;
import com.ugi.durimoa.board.vo.BoardInfoVO;
import com.ugi.durimoa.board.vo.BoardVO;
import com.ugi.durimoa.board.vo.LikeVO;
import com.ugi.durimoa.board.vo.ReplyVO;
import com.ugi.durimoa.member.vo.MemberVO;
import com.ugi.durimoa.travel.vo.SearchVO;
import com.ugi.durimoa.travel.vo.TravelVO;

@Service
public class BoardService {

	@Autowired // 의존성 주입
	IBoardDAO dao;

	public void boardAdd(BoardVO vo) throws Exception {

		int result = dao.boardAdd(vo);

		if (result == 0) {
			throw new Exception();
		}
	};

	// 게시글 전체 조회
	public ArrayList<BoardInfoVO> getBoardList(String memId) throws Exception {

		ArrayList<BoardInfoVO> result = dao.getBoardList(memId);

		if (result == null) {
			throw new Exception();
		}
		return result;
	};
	
	// 내 게시글 조회
	public ArrayList<BoardInfoVO> myBoard(String memId) throws Exception{
		
		ArrayList<BoardInfoVO> result = dao.myBoard(memId);

		if (result == null) {
			throw new Exception();
		}
		return result;
	};
	
	// 좋아요 게시글 조회
	public ArrayList<BoardInfoVO> likeBoard(String memId) throws Exception{
		
		ArrayList<BoardInfoVO> result = dao.likeBoard(memId);
		
		if (result == null) {
			throw new Exception();
		}
		return result;
	};
	
	public void boardUpdate(BoardVO vo) {
		
		dao.boardUpdate(vo);
	};
	
	// 게시글 검색
	public ArrayList<BoardInfoVO> getBoardSearch(SearchVO vo) throws Exception{
		
		ArrayList<BoardInfoVO> result = dao.getBoardSearch(vo);

		if (result == null) {
			throw new Exception();
		}
		return result;
	};
	
	// 내 게시글 검색
	public ArrayList<BoardInfoVO> getMyBoardSearch(SearchVO vo) throws Exception{
		ArrayList<BoardInfoVO> result = dao.getMyBoardSearch(vo);

		if (result == null) {
			throw new Exception();
		}
		return result;
	};
	
	// 좋아요 게시글 검색
	public ArrayList<BoardInfoVO> getLikeBoardSearch(SearchVO vo) throws Exception{
		ArrayList<BoardInfoVO> result = dao.getLikeBoardSearch(vo);

		if (result == null) {
			throw new Exception();
		}
		return result;
	};

	// 게시글 상세 조회
	public BoardInfoVO getBoard(int brdId) throws Exception {

		BoardInfoVO result = dao.getBoard(brdId);

		if (result == null) {
			throw new Exception();
		}
		return result;
	};
	
	// 게시글 삭제
	public void boardDel(int brdId) {
		dao.boardDel(brdId);
	};

	// 댓글 작성
	public int writeReply(ReplyVO vo) throws Exception {
		int result = dao.writeReply(vo);
		if (result == 0) {
			throw new Exception();
		}

		return result;
	}

	// 단일 댓글 조회
	public ReplyVO getReply (String rpyId) {
		return dao.getReply(rpyId);
	};
	
	// 전체 댓글 조회
	public ArrayList<ReplyVO> getReplyList(int brdId){
		return dao.getReplyList(brdId);
	};
	
	// 댓글 삭제
	public void delReply(String rpyId) throws Exception {
		int result = dao.delReply(rpyId);
		if (result == 0) {
			throw new Exception();
		}
	}
	
	// 댓글 갯수 조회
	public int rpyCnt(int brdId) {
		int result = dao.rpyCnt(brdId);

		System.out.println(result);
		return result;
	}
	
	// 좋아요 갯수
	public int likesCnt(int brdId)  {
		int result = dao.likesCnt(brdId);

		return result;
	};
	
	// 좋아요 체크
	public int likeCk(LikeVO vo) {
		int result = dao.likeCk(vo);
		
		return result;
	};
	
	public void likeAdd(LikeVO vo) {
		dao.likeAdd(vo);
	};
	
	public void likeDel(LikeVO vo) {
		dao.likeDel(vo);
	};
	
	public MemberVO boardWriter(String memId) {
		return dao.boardWriter(memId);
	};
	
	// 조회수 증가
	public void countUp(int brdId) {
		dao.countUp(brdId);
	};
	
	public void tagUpdate(BoardVO vo) {
		dao.tagUpdate(vo);
	};
}
