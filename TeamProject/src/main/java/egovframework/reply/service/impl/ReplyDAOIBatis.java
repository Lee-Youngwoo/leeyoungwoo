package egovframework.reply.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.reply.service.ReplyDAO;
import egovframework.reply.service.ReplyVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("daoIBatisRepl")
public class ReplyDAOIBatis extends EgovAbstractDAO implements ReplyDAO{

	public ReplyDAOIBatis() {
		System.out.println("[ReplyDAOIBatis() 생성]");
	}
	
	public void insertReply(ReplyVO vo) throws Exception{
		insert("ReplyDAO.insertReply",vo);
	}
	
	public void updateReply(ReplyVO vo) throws Exception{
		update("ReplyDAO.updateReply",vo);
	}
	
	public void deleteReply(ReplyVO vo) throws Exception{
		delete("ReplyDAO.deleteReply",vo);
	}
	
	public ReplyVO selectReply(ReplyVO vo) throws Exception{
		return (ReplyVO) select("ReplyDAO.selectReply",vo);
	}
	
	public List<ReplyVO> selectReplyList(ReplyVO vo) throws Exception{
		return (List<ReplyVO>) list("ReplyDAO.selectReplyList",vo);
	}

	@Override
	public void up(int cno) throws Exception {
		update("ReplyDAO.up",cno);
		
	}

	@Override
	public void down(int cno) throws Exception {
		update("ReplyDAO.down",cno);
		
	}
}
