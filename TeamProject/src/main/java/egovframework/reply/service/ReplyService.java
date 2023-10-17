package egovframework.reply.service;

import java.util.List;

public interface ReplyService {

	void insertReply(ReplyVO vo) throws Exception;

	void updateReply(ReplyVO vo) throws Exception;

	void deleteReply(ReplyVO vo) throws Exception;

	ReplyVO selectReply(ReplyVO vo) throws Exception;

	List<ReplyVO> selectReplyList(ReplyVO vo) throws Exception;
	
	void up(int cno) throws Exception;
	
	void down(int cno) throws Exception;
}