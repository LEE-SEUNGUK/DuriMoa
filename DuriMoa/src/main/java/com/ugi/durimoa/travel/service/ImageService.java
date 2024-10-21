package com.ugi.durimoa.travel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ugi.durimoa.travel.dao.IImageDAO;
import com.ugi.durimoa.travel.vo.ImageVO;

@Service
public class ImageService {

	@Autowired // 의존성 주입
	IImageDAO dao;

	public void imagesAdd(List<ImageVO> images) throws Exception {
		for (ImageVO image : images) {
			int result = dao.imagesAdd(image);
			if (result == 0) {
				throw new Exception("Failed to insert image: " + image.getTrvImg());
			}
		}
	}

	// 이미지 삭제(재저장을 위해)
	public void deleteImagesByTrvId(int trvId) throws Exception {
		int result = dao.deleteImagesByTrvId(trvId);
		if (result == 0) {
			throw new Exception("Failed to delete images for trvId: " + trvId);
		}
	}
}
