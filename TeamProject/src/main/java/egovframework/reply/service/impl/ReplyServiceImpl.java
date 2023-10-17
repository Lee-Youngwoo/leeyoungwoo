package egovframework.reply.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.reply.service.ReplyDAO;
import egovframework.reply.service.ReplyService;
import egovframework.reply.service.ReplyVO;


@Service("ReplyService")
public class ReplyServiceImpl implements ReplyService {

	@Resource(name="daoIBatisRepl")
	private ReplyDAO replyDAO;
	
	public void insertReply(ReplyVO vo) throws Exception{
		replyDAO.insertReply(vo);
	}
	
	public void updateReply(ReplyVO vo) throws Exception{
		replyDAO.updateReply(vo);
	}
	
	public void deleteReply(ReplyVO vo) throws Exception{
		replyDAO.deleteReply(vo);
	}
	
	public ReplyVO selectReply(ReplyVO vo) throws Exception{
		return replyDAO.selectReply(vo);
	}
	
	public List<ReplyVO> selectReplyList(ReplyVO vo) throws Exception{
		return replyDAO.selectReplyList(vo);
	}

	@Override
	public void up(int cno) throws Exception {
		replyDAO.up(cno);
		
	}

	@Override
	public void down(int cno) throws Exception {
		replyDAO.down(cno);
		
	}
}
