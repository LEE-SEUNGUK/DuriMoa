package com.ugi.durimoa.board.web;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ugi.durimoa.board.service.BimageService;
import com.ugi.durimoa.board.service.BoardService;
import com.ugi.durimoa.board.vo.BimageVO;
import com.ugi.durimoa.board.vo.BoardInfoVO;
import com.ugi.durimoa.board.vo.BoardVO;
import com.ugi.durimoa.board.vo.LikeVO;
import com.ugi.durimoa.board.vo.ReplyVO;
import com.ugi.durimoa.member.vo.MemberVO;
import com.ugi.durimoa.travel.service.TravelService;
import com.ugi.durimoa.travel.vo.ImageVO;
import com.ugi.durimoa.travel.vo.SearchVO;
import com.ugi.durimoa.travel.vo.TravelInfoVO;
import com.ugi.durimoa.travel.vo.TravelVO;

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
		ArrayList<BoardInfoVO> boardList = boardService.getBoardList(login.getMemId());

		model.addAttribute("travelList", travelList);
		model.addAttribute("boardList", boardList);

		System.out.println(boardList.toString());

		return "/board/boardView";
	}

	@ResponseBody
	@RequestMapping("/getBoardSearch")
	public ArrayList<BoardInfoVO> getBoardSearch(SearchVO vo) throws Exception {

		ArrayList<BoardInfoVO> boardList = boardService.getBoardSearch(vo);

		System.out.println(boardList);

		return boardList;
	}

	@ResponseBody
	@RequestMapping("/getMyBoardSearch")
	public ArrayList<BoardInfoVO> getMyBoardSearch(@ModelAttribute SearchVO vo) throws Exception {

		System.out.println(vo);

		ArrayList<BoardInfoVO> boardList = boardService.getMyBoardSearch(vo);

		System.out.println(boardList);

		return boardList;
	}

	@ResponseBody
	@RequestMapping("/myBoard")
	public ArrayList<BoardInfoVO> myBoard(@RequestParam("memId") String memId) throws Exception {

		ArrayList<BoardInfoVO> boardList = boardService.myBoard(memId);

		System.out.println(boardList);

		return boardList;
	}

	@ResponseBody
	@RequestMapping("/showBoard")
	public ArrayList<BoardInfoVO> showBoard(HttpSession session) throws Exception {
		MemberVO login = (MemberVO) session.getAttribute("login");
		
		ArrayList<BoardInfoVO> boardList = boardService.getBoardList(login.getMemId());

		return boardList;
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

	@RequestMapping("/boardUpdate")
	@ResponseBody
	public String boardUpdate(@ModelAttribute BoardVO vo,
			@RequestParam(value = "brdImgs", required = false) List<MultipartFile> files,
			@RequestParam(value = "preserveImages", required = false) String preserveImages) {

		System.out.println(vo);
		System.out.println(files);

		try {
			vo.setBrdCt(vo.getBrdCt().replace("\r\n", "<br>"));
			vo.setBrdCt(vo.getBrdCt().replace(" ", "&nbsp"));

			// Update travel information
			boardService.boardUpdate(vo);

			// Only delete and update images if new files are provided AND we're not
			// preserving images
			if (files != null && !files.isEmpty() && !"true".equals(preserveImages)) {
				System.out.println("새로운 파일로 교체");
				// Delete existing images
				bimageService.deleteImagesByBrdId(vo.getBrdId());

				// Handle new image files
				List<BimageVO> images = new ArrayList<>();
				for (int i = 0; i < files.size(); i++) {
					MultipartFile file = files.get(i);
					if (!file.isEmpty()) {
						String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
						String filePath = uploadPath + File.separator + fileName;

						File dest = new File(filePath);
						file.transferTo(dest);

						BimageVO imageVO = new BimageVO();
						imageVO.setBrdId(vo.getBrdId());
						imageVO.setBrdImg(downloadPath + fileName);
						imageVO.setBrdIdx(String.valueOf(i + 1));
						images.add(imageVO);
					}
				}

				if (!images.isEmpty()) {
					bimageService.imagesAdd(images);
				}
			} else {
				System.out.println("기존 파일 유지");
			}

			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "Error: " + e.getMessage();
		}
	}

	@ResponseBody
	@RequestMapping("/getBoardEdit")
	public BoardInfoVO boardEditView(Model model, int brdId) throws Exception {
		System.out.println("수정 컨트롤러");
		System.out.println(brdId);
		BoardInfoVO vo = boardService.getBoard(brdId);
		vo.setBrdCt(vo.getBrdCt().replace("&nbsp", " "));
		vo.setBrdCt(vo.getBrdCt().replace("<br>", "\r\n"));
		
		ArrayList<ReplyVO> replyList = boardService.getReplyList(brdId);

		model.addAttribute("board", vo);
		model.addAttribute("replyList", replyList);

		System.out.println(vo.toString());
		System.out.println(replyList);

		return vo;
	}

	@RequestMapping("/getBoard")
	public String boardDetailView(Model model, int brdId, HttpSession session) throws Exception {

		System.out.println(brdId);
		BoardInfoVO vo = boardService.getBoard(brdId);
		vo.setBrdCt(vo.getBrdCt().replace("&nbsp", " "));
		vo.setBrdCt(vo.getBrdCt().replace("<br>", "\r\n"));
		
		ArrayList<ReplyVO> replyList = boardService.getReplyList(brdId);
		MemberVO login = (MemberVO) session.getAttribute("login");
		
		LikeVO ckLick = new LikeVO();
		ckLick.setBrdId(brdId);
		ckLick.setMemId(login.getMemId());
		 
		int cnt = boardService.likesCnt(brdId);
		int ck = boardService.likeCk(ckLick);
		
		model.addAttribute("ck", ck);
		model.addAttribute("cnt", cnt);
		model.addAttribute("board", vo);
		model.addAttribute("replyList", replyList);

		System.out.println(vo.toString());
		System.out.println(replyList);

		return "board/boardDetailView";
	}

	@ResponseBody
	@PostMapping("/writeReply") // @RequestBody 문자열 json 데이터를 객체로 받음
	public ReplyVO writeReply(@RequestBody ReplyVO vo) throws Exception {

		System.out.println(vo);
		Date date = new Date();
		SimpleDateFormat fdr = new SimpleDateFormat("yyMMddmmssSSS");
		String uniquId = fdr.format(date);

		System.out.println(uniquId);
		vo.setRpyId(uniquId);

		// 댓글 저장
		boardService.writeReply(vo);

		// 저장된 댓글 조회
		ReplyVO result = boardService.getReply(uniquId);
		return result;
	}

	@ResponseBody
	@PostMapping("/delReply") // @RequestBody 문자열 json 데이터를 객체로 받음
	public String delReplyDo(@RequestBody ReplyVO vo) {
		String result = "success";

		try {
			boardService.delReply(vo.getRpyId());
		} catch (Exception e) {
			e.printStackTrace();
			result = "fail";
		}

		return result;
	}

	@ResponseBody
	@RequestMapping("/boardDel")
	public String boardDel(@RequestParam("brdId") int brdId) throws Exception {

		bimageService.deleteImagesByBrdId(brdId);

		boardService.boardDel(brdId);

		return "success";
	}
	
	@RequestMapping("/increaseLike")
	@ResponseBody
	public String increaseLike(@RequestBody LikeVO vo) {
	    boardService.likeAdd(vo);
	
	    return "success";
	}
	
	@RequestMapping("/decreaseLike")
	@ResponseBody
	public String decreaseLike(@RequestBody LikeVO vo) {
		boardService.likeDel(vo);
	
	    return "success";
	}
}
