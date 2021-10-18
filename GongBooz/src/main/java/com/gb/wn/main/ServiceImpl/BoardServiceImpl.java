package com.gb.wn.main.ServiceImpl;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gb.wn.boardUtil.FileUtils;
import com.gb.wn.main.DAO.BoardDAO;
import com.gb.wn.main.Service.BoardService;
import com.gb.wn.main.board.boardVO.BoardVO;
import com.gb.wn.main.board.boardVO.SearchCriteria;


@Service("boardService")
public class BoardServiceImpl implements BoardService {

		@Autowired
		private BoardDAO bdao;
		
		@Resource(name="fileUtils")
		private FileUtils fileUtils;

		@Override
		public void boardWrite(BoardVO boardVO, MultipartHttpServletRequest mpRequest) throws Exception {
			bdao.boardWrite(boardVO);
			
			List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(boardVO, mpRequest); 
			int size = list.size();
			for(int i=0; i<size; i++){ 
				bdao.insertFile(list.get(i)); 
			}
		}
		
		@Override
		public List<BoardVO> boardList(SearchCriteria scri) throws Exception {
			return bdao.boardList(scri);
		}
		
		@Override
		public int listCount(SearchCriteria scri) throws Exception {
			return bdao.listCount(scri);
		}

		// 게시물 조회
		@Transactional(isolation = Isolation.READ_COMMITTED)
		@Override
		public BoardVO boardView(int bno) throws Exception {
			bdao.boardHit(bno);
			
			return bdao.boardView(bno);
		}

		@Override
		public void boardModify(BoardVO boardVO, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception {
			
			bdao.boardModify(boardVO);
			
			List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(boardVO, files, fileNames, mpRequest);
			Map<String, Object> tempMap = null;
			int size = list.size();
			for(int i = 0; i<size; i++) {
				tempMap = list.get(i);
				if(tempMap.get("IS_NEW").equals("Y")) {
					bdao.insertFile(tempMap);
				}else {
					bdao.updateFile(tempMap);
				}
			}
			
		}

		@Override
		public void boardDelete(int bno) throws Exception {
			
			bdao.boardDelete(bno);
			
		}

		@Override
		public List<Map<String, Object>> selectFileList(int bno) throws Exception {
			return bdao.selectFileList(bno);
		}
		
		// 첨부파일 다운로드
		@Override
		public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
			// TODO Auto-generated method stub
			return bdao.selectFileInfo(map);
		}
	


}
