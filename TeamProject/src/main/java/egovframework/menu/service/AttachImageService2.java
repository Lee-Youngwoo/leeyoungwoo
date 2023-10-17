package egovframework.menu.service;

import java.util.List;

public interface AttachImageService2 {
	/* 이미지 데이터 반환 */
	public List<AttachImageVO2> getAttachList(int nno);	
	public List<AttachImageVO2> getImageList(AttachImageDefaultVO searchVO)throws Exception;
//	public List<AttachImageVO> getImageList(AttachImageVO vo)throws Exception;
	int selectImageTotal(AttachImageDefaultVO searchVO) throws Exception;
	public List<AttachImageVO2> MainMenu(AttachImageVO2 vo) throws Exception;
}
