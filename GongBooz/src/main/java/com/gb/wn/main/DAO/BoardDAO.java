package com.gb.wn.main.DAO;



import java.util.List;

import java.util.Map;

import com.gb.wn.main.board.boardVO.BoardVO;
import com.gb.wn.main.board.boardVO.SearchCriteria;

public interface BoardDAO {

		// �Խñ� �ۼ�
		public void boardWrite(BoardVO boardVO) throws Exception;
		
		// �Խù� ��� 
		public List<BoardVO> boardList(SearchCriteria scri) throws Exception;
		
		//�Խù� �� ����
		public int listCount(SearchCriteria scri) throws Exception;
		
		// �Խù� ��ȸ
		public BoardVO boardView(int bno) throws Exception;
		
		// �Խù� ����
		public void boardModify(BoardVO boardVO) throws Exception;
		
		// �Խù� ����
		public void boardDelete(int bno) throws Exception;
		
		// ÷������ ���ε�
		public void insertFile(Map<String, Object> map) throws Exception;

		// ÷������ ��ȸ
		public List<Map<String, Object>> selectFileList(int bno) throws Exception;
		
		// ÷������ �ٿ�
		public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
		
		// ÷������ ����
		public void updateFile(Map<String, Object> map) throws Exception;
		
		// �Խ��� ��ȸ��
		public void boardHit(int bno) throws Exception;

	
	
}
