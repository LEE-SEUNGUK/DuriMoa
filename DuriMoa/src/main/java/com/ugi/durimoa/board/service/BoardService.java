package com.ugi.durimoa.board.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ugi.durimoa.board.dao.IBoardDAO;
import com.ugi.durimoa.board.vo.BoardInfoVO;
import com.ugi.durimoa.board.vo.BoardVO;

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

	// 게시글 상세 조회
	public BoardInfoVO getBoard(int brdId) throws Exception {

		BoardInfoVO result = dao.getBoard(brdId);

		if (result == null) {
			throw new Exception();
		}
		return result;
	};

}
