package com.ugi.durimoa.travel.web;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ugi.durimoa.travel.service.TravelService;
import com.ugi.durimoa.travel.vo.TravelVO;

@Controller
public class TravelController {

	@Autowired
	TravelService travelService;
	
	@Value("#{util['file.upload.path']}")
	private String uploadPath;

	@Value("#{util['file.download.path']}")
	private String downloadPath;

	@RequestMapping("/travelAdd")
	@ResponseBody
	public String travelAdd(@ModelAttribute TravelVO vo, @RequestParam("trvThumbnail") MultipartFile file) {
		try {
			if (!file.isEmpty()) {
				String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
				String filePath = uploadPath + File.separator + fileName; // 업로드 경로
				System.out.println(filePath);

				File dest = new File(filePath);

				// 파일 저장
				file.transferTo(dest);
				System.out.println("File saved at: " + filePath);

				// DB에 경로 저장 (전체 경로 형식)
				vo.setTrvPt(downloadPath + fileName); // URL 형식으로 저장
			}

			System.out.println(vo);
		} catch (IOException e) {
			e.printStackTrace();
			return "File saving error: " + e.getMessage();
		}

		System.out.println(vo);

		return "success";
	}

	@RequestMapping("/travelView")
	public String DiaryView() {

		return "/travel/travelView";
	}

	@RequestMapping("/travelWrite")
	public String TravelWrite() {

		return "/travel/travelWrite";
	}
}
