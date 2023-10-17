package egovframework.menu.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.menu.service.AttachImageVO2;
import egovframework.menu.service.MenuDAO;
import egovframework.menu.service.MenuDefaultVO;
import egovframework.menu.service.MenuVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("menudaoIBatis")
public class MenuDAOIBatis extends EgovAbstractDAO implements MenuDAO {
	public MenuDAOIBatis() {
		System.out.println("menuIbatis");
	}

	@Override
	public void insertMenu(MenuVO vo) throws Exception {
		System.out.println("ibatis insert");
		insert("MenuDAO.insertMenu", vo);
	}

	@Override
	public int updateMenu(MenuVO vo) throws Exception {
		System.out.println("ibatis update");
		return update("MenuDAO.updateMenu", vo);
	}

	@Override
	public void deleteMenu(MenuVO vo) throws Exception {
		System.out.println("ibatis delete");
		delete("MenuDAO.deleteMenu", vo);
	}

	@Override
	public MenuVO selectMenu(MenuVO vo) throws Exception {
		System.out.println("ibatis select");
		return (MenuVO) select("MenuDAO.selectMenu", vo);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MenuVO> selectMenuList(MenuDefaultVO searchVO) throws Exception {
		System.out.println("ibatis selectList");
		return (List<MenuVO>) list("MenuDAO.selectMenuList", searchVO);
	}


	@Override
	public void imageEnroll(AttachImageVO2 vo) throws Exception {
		insert("MenuDAO.imageEnroll",vo);
	}

	@Override
	public void deleteImageAll(int mNo) {
		delete("MenuDAO.deleteImageAll",mNo);
	}

	@Override
	public int selectMenuTotal(MenuDefaultVO searchVO) throws Exception {
		return (Integer) select("MenuDAO.selectMenuTotal",searchVO);
	}

	@Override
	public void up(int mno) throws Exception {
		update("MenuDAO.up",mno);
		
	}

	@Override
	public List<MenuVO> MainMenu(MenuVO vo) throws Exception {
		return (List<MenuVO>) list("MenuDAO.MainMenu", vo);
	}


}
