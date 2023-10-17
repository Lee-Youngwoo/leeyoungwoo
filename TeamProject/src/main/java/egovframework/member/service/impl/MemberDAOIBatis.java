package egovframework.member.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.member.service.MemberDAO;
import egovframework.member.service.MemberVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("MemberIBatis")
public class MemberDAOIBatis extends EgovAbstractDAO implements MemberDAO {

	public MemberDAOIBatis() {
		System.out.println("MemberIBatis생성자");
	}

	@Override
	public String insertMember(MemberVO mvo) throws Exception {
		return (String) insert("MemberDAO.insertMember", mvo);
	}

	/*
	 * @Override public String updateMember(MemberVO mvo) throws Exception { return
	 * (String) update("MemberDAO.updateMember", mvo); }
	 */
	@Override
	public void updateMember(MemberVO vo) throws Exception {
		 update("MemberDAO.updateMember", vo); 		 
	}

	@Override
	public void deleteMember(MemberVO mvo) throws Exception {
		update("MemberDAO.withDrawMember", mvo);
	}

	@Override
	public MemberVO selectMember(MemberVO mvo) throws Exception {
		return (MemberVO) select("MemberDAO.selectMember", mvo);
	}

	@Override
	public List<MemberVO> selectMemberList(MemberVO mvo) throws Exception {
		return (List<MemberVO>) list("MemberDAO.selectMemberList", mvo);
	}

	@Override
	public int selectMemberIdCheck(String uid) {
		return (int) select("MemberDAO.selectMemberIdCheck", uid);
	}

	@Override
	public int selectMemberCount(MemberVO vo) {
		return (int) select("MemberDAO.selectMemberCount", vo);

	}

	@Override
	public MemberVO loginUser(MemberVO vo) throws Exception {
		System.out.println("ibatis loginUser");
		return (MemberVO) select("MemberDAO.loginUser", vo);
	}

	@Override
	public MemberVO findId(MemberVO vo) throws Exception {
		System.out.println("ibatis findId");
		return (MemberVO) select("MemberDAO.findId", vo);
	}

	@Override
	public MemberVO findPassword(MemberVO vo) throws Exception {
		System.out.println("ibatis findPassword");
		return (MemberVO) select("MemberDAO.findPassword", vo);
	}

	@Override
	public void updatePassword(MemberVO vo) throws Exception {
		System.out.println("ibatis updatePassword");
		update("MemberDAO.updatePassword", vo);
	}

	@Override
	public MemberVO selectMemberCrypto(MemberVO vo) throws Exception {
		System.out.println("ibatis selectMemberCrypto");
		return (MemberVO) select("MemberDAO.selectMemberCrypto", vo);
	}

	@Override
	public int selectMemberEmailCheck(String email) throws Exception {
		return (int) select("MemberDAO.selectMemberEmailCheck", email);
	}
	
	@Override
	public void updateLevel(String id) throws Exception {
		update("MemberDAO.updateLevel",id);
	}

	@Override
	public void forceDelete(String id) throws Exception {
		update("MemberDAO.withDrawMember",id);
	}


}
