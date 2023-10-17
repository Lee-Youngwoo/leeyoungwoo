package egovframework.notice.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.notice.service.NoticeDAO;
import egovframework.notice.service.NoticeDefaultVO;
import egovframework.notice.service.NoticeVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("daoIBatisNotice")
public class NoticeDAOIBatis extends EgovAbstractDAO implements NoticeDAO {

	public NoticeDAOIBatis() {
		System.out.println("[NoticeIBatis() 생성]");
	}
	
	public void insertNotice(NoticeVO vo) throws Exception{
		insert("NoticeDAO.insertNotice",vo);
	}
	
	public void updateNotice(NoticeVO vo) throws Exception{
		update("NoticeDAO.updateNotice",vo);
	}
	
	public void deleteNotice(NoticeVO vo) throws Exception{
		delete("NoticeDAO.deleteNotice",vo);
	}
	
	public NoticeVO selectNotice(NoticeVO vo) throws Exception{
		return (NoticeVO) select("NoticeDAO.selectNotice",vo);
	}
	
	public List<NoticeVO> selectNoticeList(NoticeDefaultVO searchVO) throws Exception{
		return (List<NoticeVO>) list("NoticeDAO.selectNoticeList",searchVO);
	}
	
	public void viewCount(int nno) throws Exception{
		update("NoticeDAO.viewCount",nno);
	}
	
	public int selectNoticeTotal(NoticeDefaultVO searchVO) throws Exception{
		return (Integer) select("NoticeDAO.selectNoticeTotal",searchVO);
	}

	@Override
	public List<NoticeVO> MainNoticeList(NoticeVO vo) throws Exception {
		return (List<NoticeVO>)list("NoticeDAO.MainNoticeList",vo);
	}
}
