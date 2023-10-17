package egovframework.product.service;

import java.util.List;

public interface ProductDAO {
	void insertProduct(ProductVO vo) throws Exception;

	int updateProduct(ProductVO vo) throws Exception;

	void deleteProduct(ProductVO vo) throws Exception;

	ProductVO selectProduct(ProductVO vo) throws Exception;

	List<ProductVO> selectProductList(ProductDefaultVO searchVO) throws Exception;

	void imageEnroll(AttachImageVO vo) throws Exception;

	void deleteImageAll(int nno);

	int selectProductTotal(ProductDefaultVO searchVO) throws Exception;
	
	void up (int pno) throws Exception;
	
	List<ProductVO> MainProductList(ProductVO vo)throws Exception;
}
