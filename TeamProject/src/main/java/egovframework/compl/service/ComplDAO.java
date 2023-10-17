package egovframework.compl.service;

import java.util.List;

public interface ComplDAO {

void insertCompl(ComplVO vo) throws Exception;
	
	void updateCompl(ComplVO vo) throws Exception;
	
	void deleteCompl(ComplVO vo) throws Exception;
	
	ComplVO selectCompl(ComplVO vo) throws Exception;
	
	List<ComplVO> selectComplList(ComplDefaultVO searchVO) throws Exception;

	void viewCount(int cNo) throws Exception;
	
	int selectComplTotal(ComplDefaultVO searchVO) throws Exception;
	
	List<ComplVO> selectMyComplList(ComplDefaultVO searchVO) throws Exception;
	
	int selectMyComplTotal(ComplDefaultVO searchVO) throws Exception;
}