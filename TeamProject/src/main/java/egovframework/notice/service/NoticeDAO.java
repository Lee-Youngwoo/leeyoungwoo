package egovframework.notice.service;

import java.util.List;

public interface NoticeDAO {

	void insertNotice(NoticeVO vo) throws Exception;

	void updateNotice(NoticeVO vo) throws Exception;

	void deleteNotice(NoticeVO vo) throws Exception;

	NoticeVO selectNotice(NoticeVO vo) throws Exception;

	List<NoticeVO> selectNoticeList(NoticeDefaultVO searchVO) throws Exception;

	void viewCount(int nno) throws Exception;

	int selectNoticeTotal(NoticeDefaultVO searchVO) throws Exception;

	List<NoticeVO> MainNoticeList(NoticeVO vo) throws Exception;
}