package egovframework.menu.service;

import java.util.List;

public interface MenuService {

	void insertMenu(MenuVO vo) throws Exception;

	int updateMenu(MenuVO vo) throws Exception;

	void deleteMenu(MenuVO vo) throws Exception;

	MenuVO selectMenu(MenuVO vo) throws Exception;

	List<MenuVO> selectMenuList(MenuDefaultVO searchVO) throws Exception;

	void imageEnroll(AttachImageVO2 vo) throws Exception;

	void deleteImageAll(int nno);

	int selectMenuTotal(MenuDefaultVO searchVO) throws Exception;
	
	void up(int mno) throws Exception;
	
	List<MenuVO> MainMenu(MenuVO vo) throws Exception;
	
}
