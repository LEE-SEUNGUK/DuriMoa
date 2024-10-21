package com.ugi.durimoa.travel.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ugi.durimoa.travel.vo.ImageVO;

@Mapper
public interface IImageDAO {

	// 여행 추가
	public int imagesAdd(ImageVO image);

	public int deleteImagesByTrvId(int trvId);
}
