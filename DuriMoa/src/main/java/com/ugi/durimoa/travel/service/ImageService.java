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
}
