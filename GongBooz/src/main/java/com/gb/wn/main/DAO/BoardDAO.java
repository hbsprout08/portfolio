package com.gb.wn.main.DAO;



import java.util.List;

import java.util.Map;

import com.gb.wn.main.board.boardVO.BoardVO;
import com.gb.wn.main.board.boardVO.SearchCriteria;

public interface BoardDAO {

		// 게시글 작성
		public void boardWrite(BoardVO boardVO) throws Exception;
		
		// 게시물 목록 
		public List<BoardVO> boardList(SearchCriteria scri) throws Exception;
		
		//게시물 총 갯수
		public int listCount(SearchCriteria scri) throws Exception;
		
		// 게시물 조회
		public BoardVO boardView(int bno) throws Exception;
		
		// 게시물 수정
		public void boardModify(BoardVO boardVO) throws Exception;
		
		// 게시물 삭제
		public void boardDelete(int bno) throws Exception;
		
		// 첨부파일 업로드
		public void insertFile(Map<String, Object> map) throws Exception;

		// 첨부파일 조회
		public List<Map<String, Object>> selectFileList(int bno) throws Exception;
		
		// 첨부파일 다운
		public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
		
		// 첨부파일 수정
		public void updateFile(Map<String, Object> map) throws Exception;
		
		// 게시판 조회수
		public void boardHit(int bno) throws Exception;

	
	
}
