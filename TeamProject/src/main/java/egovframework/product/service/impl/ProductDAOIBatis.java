package egovframework.product.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.product.service.AttachImageVO;
import egovframework.product.service.ProductDAO;
import egovframework.product.service.ProductDefaultVO;
import egovframework.product.service.ProductVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("ProductIBatis")
public class ProductDAOIBatis extends EgovAbstractDAO implements ProductDAO{
	public ProductDAOIBatis() {
		System.out.println("ProductIBatis 생성자");
	}

	@Override
	public void insertProduct(ProductVO vo) throws Exception {
		insert("ProductDAO.insertProduct",vo);
		
	}

	@Override
	public int updateProduct(ProductVO vo) throws Exception {
		return update("ProductDAO.updateProduct",vo);
		
	}

	@Override
	public void deleteProduct(ProductVO vo) throws Exception {
		delete("ProductDAO.deleteProduct",vo);
	}

	@Override
	public ProductVO selectProduct(ProductVO vo) throws Exception {
		return (ProductVO)select("ProductDAO.selectProduct",vo);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductVO> selectProductList(ProductDefaultVO searchVO) throws Exception {
		return (List<ProductVO>) list("ProductDAO.selectProductList", searchVO);
	}

	@Override
	public void imageEnroll(AttachImageVO vo) throws Exception {
		insert("ProductDAO.imageEnroll",vo);
	}

	@Override
	public void deleteImageAll(int nno) {
		delete("ProductDAO.deleteImageAll",nno);
		
	}

	@Override
	public int selectProductTotal(ProductDefaultVO searchVO) throws Exception {
		return (Integer) select("ProductDAO.selectProductTotal",searchVO);
	}

	@Override
	public void up(int pno) throws Exception {
		update("ProductDAO.up",pno);
		
	}

	@Override
	public List<ProductVO> MainProductList(ProductVO vo) throws Exception {
		return (List<ProductVO>)list("ProductDAO.MainProductList",vo);
	}
	
	
}
