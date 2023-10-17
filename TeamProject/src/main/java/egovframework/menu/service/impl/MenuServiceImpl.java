package egovframework.menu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import egovframework.menu.service.AttachImageVO2;
import egovframework.menu.service.MenuDAO;
import egovframework.menu.service.MenuDefaultVO;
import egovframework.menu.service.MenuService;
import egovframework.menu.service.MenuVO;

@Service("menuService")
public class MenuServiceImpl implements MenuService{
	@Resource(name="menudaoIBatis")
	private MenuDAO menuDAO;
	

	@Override
	public void insertMenu(MenuVO vo) throws Exception {
		menuDAO.insertMenu(vo);
		
		if(vo.getImageList()==null||vo.getImageList().size()<=0) {
			return;
		}//조건문 = 첨부이미지가 없을 경우 실행 종료되도록
		
		vo.getImageList().forEach(attach->{
			try {
				attach.setMno(vo.getMno());
				menuDAO.imageEnroll(attach);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		});//기존 nno 값을 이미지에도 nno값을 부여
		
	}
	@Transactional
	@Override
	public int updateMenu(MenuVO vo) throws Exception {
		int result=menuDAO.updateMenu(vo);
		if(result ==1&&vo.getImageList()!=null&&vo.getImageList().size()>0) {
			menuDAO.deleteImageAll(vo.getMno());
			
			vo.getImageList().forEach(attach->{
				try {
					attach.setMno(vo.getMno());
					menuDAO.imageEnroll(attach);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			});
		}
		return result;
		
	}

	@Override
	public void deleteMenu(MenuVO vo) throws Exception {
		menuDAO.deleteMenu(vo);
		
	}

	@Override
	public MenuVO selectMenu(MenuVO vo) throws Exception {
		return menuDAO.selectMenu(vo);
	}

	@Override
	public List<MenuVO> selectMenuList(MenuDefaultVO searchVO) throws Exception {
		return menuDAO.selectMenuList(searchVO);
	}

	@Override
	public void imageEnroll(AttachImageVO2 vo) throws Exception {
		menuDAO.imageEnroll(vo);
		
	}

	@Override
	public void deleteImageAll(int mNo) {
		menuDAO.deleteImageAll(mNo);
	}

	@Override
	public int selectMenuTotal(MenuDefaultVO searchVO) throws Exception {
		return menuDAO.selectMenuTotal(searchVO);
	}
	@Override
	public void up(int mno) throws Exception {
		menuDAO.up(mno);
		
	}
	@Override
	public List<MenuVO> MainMenu(MenuVO vo) throws Exception {
		return menuDAO.MainMenu(vo);
	}
}
