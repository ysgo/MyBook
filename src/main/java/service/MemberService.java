package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.support.SessionStatus;

import dao.MemberDAO;
import vo.MemberVO;

@Service
public class MemberService {
	@Autowired
	private MemberDAO dao;
 
	// 회원 가입
	public boolean signup(MemberVO vo) throws Exception {
		 return dao.signup(vo);
	}

	//회원 로그인 정보
	public MemberVO viewMember(MemberVO vo) {
		return dao.viewMember(vo);
	}
	
	// 중복 닉네임 체크
	public int userNameCheck(String userName) {
		return dao.checkOverName(userName);
	}
	
	// 중복 아이디 체크
	public int userIdCheck(String userId) {
		return dao.checkOverId(userId);
	}
	
	// 로그아웃
	public void signout(SessionStatus session) throws Exception {
		dao.signout(session);
	}
	
	// 아이디 찾기
	public String find_id(String userName) {
		String id = dao.find_id(userName);
		if (id == null) {
			return null;
		} else {
			return id;
		}
	}
	
	// 비밀번호 찾기
	public String find_pw(MemberVO vo) {
		String pass = dao.find_pw(vo);
		if(pass == null) {
			return null;
		} else {
			return pass;
		}
	}
	
	// 임시 비밀번호 수정
	public void tmp_pw(MemberVO vo) {
		dao.tmp_pw(vo);
	}
	
	// 회원 탈퇴
	public boolean withdrawal(String userId) {
		return dao.withdrawal(userId);
	}
	
	// 회원 정보 수정
	public boolean updateMember(MemberVO vo) {
		return dao.updateMember(vo);
	}
} 
