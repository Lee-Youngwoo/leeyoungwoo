package egovframework.member.service;

import java.util.List;

public interface MemberDAO {
	String insertMember(MemberVO vo) throws Exception;

	void updateMember(MemberVO vo) throws Exception;

	void deleteMember(MemberVO vo) throws Exception;

	MemberVO selectMember(MemberVO vo) throws Exception;

	List<MemberVO> selectMemberList(MemberVO vo) throws Exception;

	int selectMemberIdCheck(String uid);
	
	public int selectMemberEmailCheck(String email) throws Exception;

	int selectMemberCount(MemberVO vo);

	MemberVO loginUser(MemberVO vo) throws Exception;

	MemberVO findId(MemberVO vo) throws Exception;

	MemberVO findPassword(MemberVO vo) throws Exception;

	void updatePassword(MemberVO vo) throws Exception;
	
	MemberVO selectMemberCrypto(MemberVO vo) throws Exception;
	
	void updateLevel(String id) throws Exception;

	void forceDelete(String id) throws Exception;
}
