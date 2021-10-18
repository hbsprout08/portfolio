package com.gb.wn.main.Service;




import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gb.wn.main.board.boardVO.BoardVO;
import com.gb.wn.main.board.boardVO.SearchCriteria;

public interface BoardService {

		// �Խñ� �ۼ�
		public void boardWrite(BoardVO boardVO, MultipartHttpServletRequest mpRequest) throws Exception;

		// �Խù� ��� ��ȸ
		public List<BoardVO> boardList(SearchCriteria scri) throws Exception;
		
		//�Խù� �� ����
		public int listCount(SearchCriteria scri) throws Exception;
		
		// �Խù� ��ȸ
		public BoardVO boardView(int bno) throws Exception;
		
		// �Խù� ����
		public void boardModify(BoardVO boardVO, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception;
		
		// �Խù� ����
		public void boardDelete(int bno) throws Exception;
		
		// ÷������ ��ȸ
		public List<Map<String, Object>> selectFileList(int bno) throws Exception;
		
		// ÷������ �ٿ�'
		public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
		
	
	
	
}
