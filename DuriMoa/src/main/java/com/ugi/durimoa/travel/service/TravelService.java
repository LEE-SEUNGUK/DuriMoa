package com.ugi.durimoa.travel.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ugi.durimoa.member.vo.MemberVO;
import com.ugi.durimoa.travel.dao.ITravelDAO;
import com.ugi.durimoa.travel.vo.ImageVO;
import com.ugi.durimoa.travel.vo.TravelInfoVO;
import com.ugi.durimoa.travel.vo.TravelVO;

@Service
public class TravelService {

	@Autowired // 의존성 주입
	ITravelDAO dao;

	@Value("#{util['file.upload.path']}")
	private String uploadPath;

	@Value("#{util['file.download.path']}")
	private String downloadPath;

	public void travelAdd(TravelVO vo) throws Exception {
		System.out.println("travelAdd");

		int result = dao.travelAdd(vo);

		if (result == 0) {
			throw new Exception();
		}
	};

	public ArrayList<TravelInfoVO> getTravelList(MemberVO vo) throws Exception {
		System.out.println("전체 조회 서비스");

		ArrayList<TravelInfoVO> result = dao.getTravelList(vo);

		if (result == null) {
			throw new Exception();
		}
		return result;
	};

}
