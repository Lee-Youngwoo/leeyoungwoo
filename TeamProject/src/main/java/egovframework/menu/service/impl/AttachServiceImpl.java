package egovframework.menu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.menu.service.AttachImageDAO;
import egovframework.menu.service.AttachImageDefaultVO;
import egovframework.menu.service.AttachImageService2;
import egovframework.menu.service.AttachImageVO2;

@Service("ImageService2")
public class AttachServiceImpl implements AttachImageService2{
	@Resource(name = "AttachdaoIBatis2")
	private AttachImageDAO attachImageDAO;
	
	@Override
	public List<AttachImageVO2> getAttachList(int nno) {
		return attachImageDAO.getAttachList(nno);
	}
	


	@Override
	public int selectImageTotal(AttachImageDefaultVO searchVO) throws Exception {
		return attachImageDAO.selectImageTotal(searchVO);
	}

	
	 @Override 
	 public List<AttachImageVO2> getImageList(AttachImageDefaultVO searchVO) throws Exception { 
		 return attachImageDAO.getImageList(searchVO); 
	}



	@Override
	public List<AttachImageVO2> MainMenu(AttachImageVO2 vo) throws Exception {
		return attachImageDAO.MainMenu(vo);
	}
	 

}
