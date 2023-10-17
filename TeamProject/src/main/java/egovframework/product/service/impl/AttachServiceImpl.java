package egovframework.product.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.product.service.AttachImageDAO;
import egovframework.product.service.AttachImageDefaultVO;
import egovframework.product.service.AttachImageService;
import egovframework.product.service.AttachImageVO;

@Service("ImageService")
public class AttachServiceImpl implements AttachImageService{
	@Resource(name = "AttachdaoIBatis")
	private AttachImageDAO attachImageDAO;
	
	@Override
	public List<AttachImageVO> getAttachList(int nno) {
		return attachImageDAO.getAttachList(nno);
	}
	


	@Override
	public int selectImageTotal(AttachImageDefaultVO searchVO) throws Exception {
		return attachImageDAO.selectImageTotal(searchVO);
	}

	
	 @Override 
	 public List<AttachImageVO> getImageList(AttachImageDefaultVO searchVO) throws Exception { 
		 return attachImageDAO.getImageList(searchVO); 
	}



	@Override
	public List<AttachImageVO> MainProduct(AttachImageVO vo) throws Exception {
		return attachImageDAO.MainProduct(vo);
	}
	 

}
