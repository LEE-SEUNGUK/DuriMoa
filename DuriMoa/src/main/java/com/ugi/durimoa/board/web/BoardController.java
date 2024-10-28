package com.ugi.durimoa.board.web;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ugi.durimoa.board.service.BimageService;
import com.ugi.durimoa.board.service.BoardService;
import com.ugi.durimoa.board.vo.BimageVO;
import com.ugi.durimoa.board.vo.BoardInfoVO;
import com.ugi.durimoa.board.vo.BoardVO;
import com.ugi.durimoa.member.vo.MemberVO;
import com.ugi.durimoa.travel.service.TravelService;
import com.ugi.durimoa.travel.vo.TravelInfoVO;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	TravelService travelService;
	
	@Autowired
	BimageService bimageService;
	
	@Value("#{util['file.upload.path']}")
	private String uploadPath;

	@Value("#{util['file.download.path']}")
	private String downloadPath;

	@RequestMapping("/boardView")
	public String DiaryView(Model model, HttpSession session) throws Exception {

		MemberVO login = (MemberVO) session.getAttribute("login");

		ArrayList<TravelInfoVO> travelList = travelService.getTravelList(login);
		ArrayList<BoardInfoVO> boardList = boardService.getBoardList();

		model.addAttribute("travelList", travelList);
		model.addAttribute("boardList", boardList);
		
		System.out.println(boardList);

		return "/board/boardView";
	}
	
	@RequestMapping("/boardAdd")
	@ResponseBody
	public String travelAdd(@ModelAttribute BoardVO vo, @RequestParam("brdImgs") List<MultipartFile> files)
			throws Exception {
		System.out.println(vo);
		try {
			
			vo.setBrdCt(vo.getBrdCt().replace("\r\n", "<br>"));
			vo.setBrdCt(vo.getBrdCt().replace(" ", "&nbsp"));
			
			// Save TravelVO
			boardService.boardAdd(vo);

			// Handle image files
			if (!files.isEmpty()) {
				List<BimageVO> images = new ArrayList<>();
				for (int i = 0; i < files.size(); i++) {
					MultipartFile file = files.get(i);
					if (!file.isEmpty()) {
						String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
						String filePath = uploadPath + File.separator + fileName;

						File dest = new File(filePath);
						file.transferTo(dest);

						System.out.println("File saved at: " + filePath);

						BimageVO imageVO = new BimageVO();
						imageVO.setBrdId(vo.getBrdId());
						imageVO.setBrdImg(downloadPath + fileName);
						imageVO.setBrdIdx(String.valueOf(i + 1));
						images.add(imageVO);
					}
				}

				System.out.println(images);

				if (!images.isEmpty()) {
					bimageService.imagesAdd(images);
				}
			}

			return "success";
		} catch (IOException e) {
			e.printStackTrace();
			return "Error: " + e.getMessage();
		}
	}
	
	@RequestMapping("/getBoard")
	public String boardDetailView(Model model, int brdId) throws Exception {
		
		System.out.println(brdId);
		BoardInfoVO vo = boardService.getBoard(brdId);
		
		model.addAttribute("board", vo);
		
		System.out.println(vo.toString());
		
		return "board/boardDetailView";
	}
}
