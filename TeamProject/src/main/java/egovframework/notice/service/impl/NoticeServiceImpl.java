package egovframework.notice.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.notice.service.NoticeDAO;
import egovframework.notice.service.NoticeDefaultVO;
import egovframework.notice.service.NoticeService;
import egovframework.notice.service.NoticeVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("NoticeService")
public class NoticeServiceImpl extends EgovAbstractServiceImpl implements NoticeService{

	@Resource(name="daoIBatisNotice")
	private NoticeDAO noticeDAO;
	
	public void insertNotice(NoticeVO vo) throws Exception{
		noticeDAO.insertNotice(vo);
	}
	
	public void updateNotice(NoticeVO vo) throws Exception{
		noticeDAO.updateNotice(vo);
	}
	
	public void deleteNotice(NoticeVO vo) throws Exception{
		noticeDAO.deleteNotice(vo);
	}
	
	public NoticeVO selectNotice(NoticeVO vo) throws Exception{
		return noticeDAO.selectNotice(vo);
	}
	
	public List<NoticeVO> selectNoticeList(NoticeDefaultVO searchVO) throws Exception{
		return noticeDAO.selectNoticeList(searchVO);
	}
	
	public void viewCount(int nno) throws Exception{
		noticeDAO.viewCount(nno);
	}
	
	public int selectNoticeTotal(NoticeDefaultVO searchVO) throws Exception{
		return noticeDAO.selectNoticeTotal(searchVO);
	}

	@Override
	public List<NoticeVO> MainNoticeList(NoticeVO vo) throws Exception {
		return noticeDAO.MainNoticeList(vo);
	}
}
