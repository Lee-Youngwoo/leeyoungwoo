package egovframework.product.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.product.service.AttachImageDAO;
import egovframework.product.service.AttachImageDefaultVO;
import egovframework.product.service.AttachImageVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("AttachdaoIBatis")
public class AttachImageDAOIBatis extends EgovAbstractDAO implements AttachImageDAO{

	@Override
	public List<AttachImageVO> getAttachList(int nno) {
		return (List<AttachImageVO>) list("AttachImageDAO.getAttachList", nno);
	}


	@Override
	public int selectImageTotal(AttachImageDefaultVO searchVO) throws Exception {
		return (Integer) select("AttachImageDAO.selectImageTotal",searchVO);
	}

	@Override
	public List<AttachImageVO> getImageList(AttachImageDefaultVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return (List<AttachImageVO>) list("AttachImageDAO.getImageList", searchVO);
	}


	@Override
	public List<AttachImageVO> MainProduct(AttachImageVO vo) throws Exception {
		return (List<AttachImageVO>) list("AttachImageDAO.MainProduct", vo);
	}

}
