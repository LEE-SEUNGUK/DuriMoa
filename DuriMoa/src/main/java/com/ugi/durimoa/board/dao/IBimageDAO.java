package com.ugi.durimoa.board.dao;

import org.apache.ibatis.annotations.Mapper;

import com.ugi.durimoa.board.vo.BimageVO;

@Mapper
public interface IBimageDAO {
	// 여행 추가
		public int imagesAdd(BimageVO image);
}
