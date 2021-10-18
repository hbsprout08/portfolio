package com.gb.wn;




import java.io.File;



import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gb.wn.main.Service.BoardService;
import com.gb.wn.main.Service.ReplayService;
import com.gb.wn.main.board.boardVO.BoardVO;
import com.gb.wn.main.board.boardVO.Criteria;
import com.gb.wn.main.board.boardVO.PageMaker;
import com.gb.wn.main.board.boardVO.ReplyVO;
import com.gb.wn.main.board.boardVO.SearchCriteria;
import com.gb.wn.main.member.memberVO.MemberVO;


@Controller
public class BoardController {

	@Resource(name="boardService")
	private BoardService boardkaja;
	
	@Resource(name="replyService")
	private ReplayService replykaja;

	@RequestMapping(value="board/boardInsert.do")
	public String boardIsert(){
		
		return "board/boardWrite";
	}
	
	//�Խ��� �۾���
	@RequestMapping(value="board/boardWrite.do", method = RequestMethod.POST)
	public String boardWrite(BoardVO boardVO,  MultipartHttpServletRequest mpRequest) throws Exception {
		System.out.println("�Խ��� �۾��� �Դ�. ");
		boardkaja.boardWrite(boardVO, mpRequest);
		
		return "redirect:/board/boardList.do";
	}
	
	//�Խ��� �� ���
	@RequestMapping(value="board/boardList.do", method = RequestMethod.GET)
	public String boardList(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		
		model.addAttribute("boardList", boardkaja.boardList(scri));
		
		PageMaker pageMaker  = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(boardkaja.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		return "board/boardList";
	}
	
	// �Խ��� ��ȸ
	@RequestMapping(value="board/boardView.do", method = RequestMethod.GET)
	public String boardView(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri , Model model) throws Exception {
		System.out.println("�Խù��ۺ���");
		
	
		
		model.addAttribute("boardView", boardkaja.boardView(boardVO.getBno()));
		model.addAttribute("scri", scri);
		
		List<ReplyVO> replyList = replykaja.readReply(boardVO.getBno());
		model.addAttribute("replyList", replyList);
		
		List<Map<String, Object>> fileList = boardkaja.selectFileList(boardVO.getBno());
		model.addAttribute("file", fileList);
		return "board/boardView";
	}

	
	//�Խ��� ���� ��
	@RequestMapping(value="board/modifyView.do", method = RequestMethod.GET)
	public String modifyView(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		System.out.println("������");
		model.addAttribute("modifyView", boardkaja.boardView(boardVO.getBno()) );
		model.addAttribute("scri", scri);
		
		List<Map<String, Object>> fileList = boardkaja.selectFileList(boardVO.getBno());
		model.addAttribute("file", fileList);
		
		return "board/modifyView";
	}
	
	//�Խ��� ����
	@RequestMapping(value="board/boardDelete.do", method = RequestMethod.POST)
	public String boardDelete(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		
		boardkaja.boardDelete(boardVO.getBno());
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/boardList.do";
	}
	
	//��� �ۼ�
	@RequestMapping(value="board/replyWrite.do", method = RequestMethod.POST)
	public String replyWrite(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr,MemberVO membervo) throws Exception {
		replykaja.writeReply(vo);
		
		rttr.addAttribute("userid", membervo.getUserid());
		System.out.println("��� �ۼ�2"+"/"+membervo.getUserid());
		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/boardView.do";
	}
	
	//��� ���� GET
	@RequestMapping(value="board/replyUpdateView.do", method = RequestMethod.GET)
	public String replyUpdateView(ReplyVO vo, SearchCriteria scri ,Model model) throws Exception {

		model.addAttribute("replyUpdate", replykaja.selectReply(vo.getRno()));
		model.addAttribute("scri", scri);
		
		return "board/replyUpdateView";
	}
	
	//��� ���� POST
	@RequestMapping(value="/board/replyUpdate.do", method = RequestMethod.POST)
	public String replyUpdate(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		
		replykaja.updateReply(vo);
		
		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/boardView.do";
	}
	
	//��� ���� GET
	@RequestMapping(value="/board/replyDeleteView.do", method = RequestMethod.GET)
	public String replyDeleteView(ReplyVO vo, SearchCriteria scri, Model model) throws Exception {
		
		model.addAttribute("replyDelete", replykaja.selectReply(vo.getRno()));
		model.addAttribute("scri", scri);
		

		return "board/replyDeleteView";
	}
	
	//��� ����
	@RequestMapping(value="/board/replyDelete.do", method = RequestMethod.POST)
	public String replyDelete(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		System.out.println("��� ����");
		replykaja.deleteReply(vo);
		
		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/boardView.do";
	}
	
	@RequestMapping(value="/board/fileDown.do")
	public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception{
		Map<String, Object> resultMap = boardkaja.selectFileInfo(map);
		String storedFileName = (String) resultMap.get("STORED_FILE_NAME");
		String originalFileName = (String) resultMap.get("ORG_FILE_NAME");
		
		// ������ �����ߴ� ��ġ���� ÷�������� �о� byte[]�������� ��ȯ�Ѵ�.
		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("C:\\gb\\file\\"+storedFileName));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+"\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
	}

	
}
