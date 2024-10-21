package com.ugi.durimoa.travel.web;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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

import com.ugi.durimoa.travel.service.ImageService;
import com.ugi.durimoa.travel.service.TravelService;
import com.ugi.durimoa.travel.vo.ImageVO;
import com.ugi.durimoa.travel.vo.TravelVO;

@Controller
public class TravelController {

	@Autowired
	TravelService travelService;
	
	@Autowired
	ImageService imageService;

	@Value("#{util['file.upload.path']}")
	private String uploadPath;

	@Value("#{util['file.download.path']}")
	private String downloadPath;

	@RequestMapping("/travelAdd")
	@ResponseBody
	public String travelAdd(@ModelAttribute TravelVO vo, @RequestParam("trvImgs") List<MultipartFile> files)
			throws Exception {
		System.out.println(vo);
		try {
			// Handle TravelVO data
			String trvOp = vo.getTrvOp();
			vo.setTrvOp(trvOp != null && trvOp.equals("on") ? "Y" : "N");

			// Save TravelVO
			travelService.travelAdd(vo);

			// Handle image files
			if (!files.isEmpty()) {
				List<ImageVO> images = new ArrayList<>();
				for (int i = 0; i < files.size(); i++) {
					MultipartFile file = files.get(i);
					if (!file.isEmpty()) {
						String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
						String filePath = uploadPath + File.separator + fileName;

						File dest = new File(filePath);
						file.transferTo(dest);

						System.out.println("File saved at: " + filePath);

						ImageVO imageVO = new ImageVO();
						imageVO.setTrvId(vo.getTrvId());
						imageVO.setTrvImg(downloadPath + fileName);
						imageVO.setTrvIdx(String.valueOf(i + 1));
						images.add(imageVO);
					}
				}

				System.out.println(images);

				if (!images.isEmpty()) {
					imageService.imagesAdd(images);
				}
			}

			return "success";
		} catch (IOException e) {
			e.printStackTrace();
			return "Error: " + e.getMessage();
		}
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
