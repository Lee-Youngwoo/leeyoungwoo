package egovframework.menu.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.menu.service.AttachImageDAO;
import egovframework.menu.service.AttachImageDefaultVO;
import egovframework.menu.service.AttachImageVO2;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("AttachdaoIBatis2")
public class AttachImageDAOIBatis extends EgovAbstractDAO implements AttachImageDAO{

	@Override
	public List<AttachImageVO2> getAttachList(int nno) {
		return (List<AttachImageVO2>) list("AttachImageDAO.getAttachList2", nno);
	}


	@Override
	public int selectImageTotal(AttachImageDefaultVO searchVO) throws Exception {
		return (Integer) select("AttachImageDAO.selectImageTotal2",searchVO);
	}

	@Override
	public List<AttachImageVO2> getImageList(AttachImageDefaultVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return (List<AttachImageVO2>) list("AttachImageDAO.getImageList2", searchVO);
	}


	@Override
	public List<AttachImageVO2> MainMenu(AttachImageVO2 vo) throws Exception {
		return (List<AttachImageVO2>) list("AttachImageDAO.MainMenu", vo);
	}

}
