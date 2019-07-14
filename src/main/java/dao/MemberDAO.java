package dao;

import org.springframework.web.bind.support.SessionStatus;

import vo.MemberVO;

public interface MemberDAO {

	// 회원 가입
	public boolean signup(MemberVO vo) throws Exception;
	
	// 로그인
//	public MemberVO signin(MemberVO vo) throws Exception;
	
	// 회원 로그인 체크
	public boolean loginCheck(MemberVO vo);
	//회원 로그인 정보
	public MemberVO viewMember(MemberVO vo);
	// 회원 로그아웃
	public void signout(SessionStatus session);
	
	public int checkOverId(String userId);
}
