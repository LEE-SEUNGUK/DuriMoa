package com.ugi.durimoa.board.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ugi.durimoa.board.dao.IBimageDAO;
import com.ugi.durimoa.board.vo.BimageVO;
import com.ugi.durimoa.board.vo.BoardInfoVO;
import com.ugi.durimoa.travel.vo.TravelInfoVO;

@Service
public class BimageService {

	@Autowired // 의존성 주입
	IBimageDAO dao;

	public void imagesAdd(List<BimageVO> images) throws Exception {
		for (BimageVO image : images) {
			int result = dao.imagesAdd(image);
			if (result == 0) {
				throw new Exception("Failed to insert image: " + image.getBrdImg());
			}
		}
	}
}
