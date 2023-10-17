package egovframework.product.service;

import java.util.List;


public interface AttachImageService {
	/* 이미지 데이터 반환 */
	public List<AttachImageVO> getAttachList(int nno);	
	public List<AttachImageVO> getImageList(AttachImageDefaultVO searchVO)throws Exception;
//	public List<AttachImageVO> getImageList(AttachImageVO vo)throws Exception;
	int selectImageTotal(AttachImageDefaultVO searchVO) throws Exception;
	public List<AttachImageVO> MainProduct(AttachImageVO vo) throws Exception;
}
