package com.ugi.durimoa.board.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ugi.durimoa.board.dao.IBoardDAO;
import com.ugi.durimoa.board.vo.BoardInfoVO;
import com.ugi.durimoa.board.vo.BoardVO;
import com.ugi.durimoa.board.vo.ReplyVO;
import com.ugi.durimoa.travel.vo.SearchVO;

@Service
public class BoardService {

	@Autowired // 의존성 주입
	IBoardDAO dao;

	public void boardAdd(BoardVO vo) throws Exception {
		System.out.println("게시판 추가");

		int result = dao.boardAdd(vo);

		if (result == 0) {
			throw new Exception();
		}
	};

	// 게시글 전체 조회
	public ArrayList<BoardInfoVO> getBoardList() throws Exception {
		System.out.println("게시글 조회 서비스");

		ArrayList<BoardInfoVO> result = dao.getBoardList();

		if (result == null) {
			throw new Exception();
		}
		return result;
	};
	
	// 내 게시글 조회
	public ArrayList<BoardInfoVO> myBoard(String memId) throws Exception{
		System.out.println("내 게시글 조회 서비스");
		
		ArrayList<BoardInfoVO> result = dao.myBoard(memId);

		if (result == null) {
			throw new Exception();
		}
		return result;
	};
	
	// 게시글 검색
	public ArrayList<BoardInfoVO> getBoardSearch(String kerWord) throws Exception{
		System.out.println("게시글 검색");
		
		ArrayList<BoardInfoVO> result = dao.getBoardSearch(kerWord);

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

	// 게시글 상세 조회
	public BoardInfoVO getBoard(int brdId) throws Exception {

		BoardInfoVO result = dao.getBoard(brdId);

		if (result == null) {
			throw new Exception();
		}
		return result;
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
	public int cntReply(int brdId) throws Exception {
		int result = dao.cntReply(brdId);
		if (result == 0) {
			throw new Exception();
		}

		return result;
	}
}
