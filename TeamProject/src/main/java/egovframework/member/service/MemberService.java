package egovframework.member.service;

import java.util.List;

public interface MemberService {
	String insertMember(MemberVO vo) throws Exception;

	// 중복아이디체크
	public int selectMemberIdCheck(String uid) throws Exception;

	public int selectMemberEmailCheck(String email) throws Exception;

	void updateMember(MemberVO vo) throws Exception;

	void deleteMember(MemberVO vo) throws Exception;

	MemberVO selectMember(MemberVO vo) throws Exception;

	List<MemberVO> selectMemberList(MemberVO vo) throws Exception;

	public int selectMemberCount(MemberVO vo) throws Exception;

	MemberVO loginUser(MemberVO vo) throws Exception;

	MemberVO findId(MemberVO vo) throws Exception;

	MemberVO findPassword(MemberVO vo) throws Exception;

	void updatePassword(MemberVO vo) throws Exception;

	MemberVO selectMemberCrypto(MemberVO vo) throws Exception;

	void updateLevel(String id) throws Exception;

	void forceDelete(String id) throws Exception;
}
