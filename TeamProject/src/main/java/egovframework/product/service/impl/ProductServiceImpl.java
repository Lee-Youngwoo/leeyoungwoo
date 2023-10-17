package egovframework.product.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import egovframework.product.service.AttachImageVO;
import egovframework.product.service.ProductDAO;
import egovframework.product.service.ProductDefaultVO;
import egovframework.product.service.ProductService;
import egovframework.product.service.ProductVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
@Service("productService")
public class ProductServiceImpl extends EgovAbstractServiceImpl implements ProductService{
	@Resource(name="ProductIBatis")
	private ProductDAO productDAO;
	
	public ProductServiceImpl() {
		System.out.println("ProductServiceImpl()");
	}

	@Override
	public void insertProduct(ProductVO vo) throws Exception {
		productDAO.insertProduct(vo);
		
		if(vo.getImageList()==null||vo.getImageList().size()<=0) {
			return;
		}//조건문 = 첨부이미지가 없을 경우 실행 종료되도록
		
		vo.getImageList().forEach(attach->{
			try {
				attach.setPno(vo.getPno());
				productDAO.imageEnroll(attach);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		});//기존 nno 값을 이미지에도 nno값을 부여
	}
	@Transactional
	@Override
	public int updateProduct(ProductVO vo) throws Exception {
		int result=productDAO.updateProduct(vo);
		if(result ==1&&vo.getImageList()!=null&&vo.getImageList().size()>0) {
			productDAO.deleteImageAll(vo.getPno());
			
			vo.getImageList().forEach(attach->{
				try {
					attach.setPno(vo.getPno());
					productDAO.imageEnroll(attach);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			});
		}
		return result;
	}

	@Override
	public void deleteProduct(ProductVO vo) throws Exception {
		productDAO.deleteProduct(vo);
	}

	@Override
	public ProductVO selectProduct(ProductVO vo) throws Exception {
		
		return productDAO.selectProduct(vo);
	}

	@Override
	public List<ProductVO> selectProductList(ProductDefaultVO searchVO) throws Exception {
		List<ProductVO> list=productDAO.selectProductList(searchVO);
		
		return list;
	}

	@Override
	public void imageEnroll(AttachImageVO vo) throws Exception {
		productDAO.imageEnroll(vo);
		
	}

	@Override
	public void deleteImageAll(int nno) {
		productDAO.deleteImageAll(nno);
		
	}

	@Override
	public int selectProductTotal(ProductDefaultVO searchVO) throws Exception {
		return productDAO.selectProductTotal(searchVO);
	}

	@Override
	public void up(int pno) throws Exception {
		productDAO.up(pno);
		
	}

	@Override
	public List<ProductVO> MainProductList(ProductVO vo) throws Exception {
		return productDAO.MainProductList(vo);
	}
	
	
}
