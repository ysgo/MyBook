package service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import dao.MemberDAO;
import vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO dao;

	// 회원 가입
	@Override 
	public boolean signup(MemberVO vo) throws Exception {
		return dao.signup(vo);		
	}

	//회원 로그인 체크
	@Override
	public boolean loginCheck(MemberVO vo, HttpSession session) {
		boolean result = dao.loginCheck(vo);
		if(result) {	// true일 경우 세션 등록
			MemberVO vo2 = viewMember(vo);
			// 세션 등록
			session.setAttribute("userId", vo2.getUserId());
			session.setAttribute("userPass", vo2.getUserPass());
			return result;
		}
		return false;
	}
	
	//회원 로그인 정보
	@Override
	public MemberVO viewMember(MemberVO vo) {
		return dao.viewMember(vo);
	}
	
	// 중복 아이디 체크
	public int userIdCheck(String userId) {
		return dao.checkOverId(userId);
	}
	
	// 로그아웃
	@Override
	public void signout(SessionStatus session) throws Exception {
		dao.signout(session);
	}
	// 아이디 찾기
	@Override
	public String find_id(String userId) {
		ModelAndView mav = new ModelAndView();
		String id = dao.find_id(userId);
		
		if (id == null) {
			mav.addObject("", "<script>alert('가입된 아이디가 없습니다.);history.go(-1);</script>");
			return null;
		} else {
			return id;
		}
	}
} 
