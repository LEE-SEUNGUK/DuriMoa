package com.ugi.durimoa.travel.web;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ugi.durimoa.member.vo.MemberVO;
import com.ugi.durimoa.travel.service.ImageService;
import com.ugi.durimoa.travel.service.TravelService;
import com.ugi.durimoa.travel.vo.ImageVO;
import com.ugi.durimoa.travel.vo.SearchVO;
import com.ugi.durimoa.travel.vo.TravelInfoVO;
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
	
	@RequestMapping("/travelUpdate")
    @ResponseBody
    public String travelUpdate(@ModelAttribute TravelVO vo, @RequestParam("trvImgs") List<MultipartFile> files) throws Exception {
        try {
            vo.setTrvOp(vo.getTrvOp() != null && vo.getTrvOp().equals("on") ? "Y" : "N");
            System.out.println(vo);
            
            // Update travel information
            travelService.travelUpdate(vo);
            
            System.out.println(files);
            
            // Delete existing images
            imageService.deleteImagesByTrvId(vo.getTrvId());
            
            // Handle new image files
            if (!files.isEmpty()) {
                List<ImageVO> images = new ArrayList<>();
                for (int i = 0; i < files.size(); i++) {
                    MultipartFile file = files.get(i);
                    System.out.println(file);
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
        } catch (Exception e) {
            e.printStackTrace();
            return "Error: " + e.getMessage();
        }
    }
	

	@ResponseBody
	@RequestMapping("/travelDel")
	public String travelDel(@RequestParam("trvId") int trvId) throws Exception {

		imageService.deleteImagesByTrvId(trvId);

		travelService.travelDel(trvId);
		
		return "success";
	}

	@ResponseBody
	@RequestMapping("/getTravel")
	public TravelInfoVO getTravel(@RequestParam("trvId") int trvId) {
		return travelService.getTravel(trvId);
	}

	@RequestMapping("/travelView")
	public String DiaryView(Model model, HttpSession session) throws Exception {

		MemberVO login = (MemberVO) session.getAttribute("login");

		ArrayList<TravelInfoVO> travelList = travelService.getTravelList(login);

		model.addAttribute("travelList", travelList);

		return "/travel/travelView";
	}
	
	@ResponseBody
	@RequestMapping("/getTravelSearch")
	public Map<String, Object> getTravelSearch(HttpSession session, @RequestParam("keyWord") String keyWord) throws Exception {
	    Map<String, Object> response = new HashMap<>();
	    
	    try {
	        MemberVO login = (MemberVO) session.getAttribute("login");
	        
	        SearchVO search = new SearchVO();
	        search.setMemId(login.getMemId());
	        search.setKeyWord(keyWord);
	        
	        ArrayList<TravelInfoVO> travelList = travelService.getTravelSearch(search);
	        
	        response.put("status", "success");
	        response.put("data", travelList);
	    } catch (Exception e) {
	        response.put("status", "error");
	        response.put("message", e.getMessage());
	    }
	    
	    return response;
	}
	
	@RequestMapping("/travelWrite")
	public String TravelWrite() {

		return "/travel/travelWrite";
	}

}
