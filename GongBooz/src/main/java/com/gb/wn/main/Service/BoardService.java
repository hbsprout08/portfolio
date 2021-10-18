package com.gb.wn.main.Service;




import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gb.wn.main.board.boardVO.BoardVO;
import com.gb.wn.main.board.boardVO.SearchCriteria;

public interface BoardService {

		// 게시글 작성
		public void boardWrite(BoardVO boardVO, MultipartHttpServletRequest mpRequest) throws Exception;

		// 게시물 목록 조회
		public List<BoardVO> boardList(SearchCriteria scri) throws Exception;
		
		//게시물 총 갯수
		public int listCount(SearchCriteria scri) throws Exception;
		
		// 게시물 조회
		public BoardVO boardView(int bno) throws Exception;
		
		// 게시물 수정
		public void boardModify(BoardVO boardVO, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception;
		
		// 게시물 삭제
		public void boardDelete(int bno) throws Exception;
		
		// 첨부파일 조회
		public List<Map<String, Object>> selectFileList(int bno) throws Exception;
		
		// 첨부파일 다운'
		public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
		
	
	
	
}
