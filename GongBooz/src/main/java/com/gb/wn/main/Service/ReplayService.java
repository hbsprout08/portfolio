package com.gb.wn.main.Service;

import java.util.List;

import com.gb.wn.main.board.boardVO.ReplyVO;

public interface ReplayService {

	public List<ReplyVO> readReply(int bno) throws Exception;
	
	public void writeReply(ReplyVO vo) throws Exception;
	
	public void updateReply(ReplyVO vo) throws Exception;
	
	public void deleteReply(ReplyVO vo) throws Exception;
	
	public ReplyVO selectReply(int rno) throws Exception;
	
	
}
