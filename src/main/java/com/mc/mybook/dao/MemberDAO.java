package com.mc.mybook.dao;

import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	// 회원 가입
//	public boolean signup(MemberVO vo) throws Exception {
//		boolean result=true;
//		String statement = "mybook.my.book.dao.MemberDAO.signup";
//		if(session.insert(statement, vo) != 1)
//			result = false;
//		return result;
//	}
//	
//	// 회원 로그인 정보
//	public MemberVO viewMember(MemberVO vo) {
//		String statement = "mybook.my.book.dao.MemberDAO.viewMember";
//		return session.selectOne(statement, vo);
//	}
//	
//	// 회원가입 닉네임 체크
//	public int checkOverName(String userName) {
//		String statement = "mybook.my.book.dao.MemberDAO.checkOverName";
//		return session.selectOne(statement,	userName);
//	}
//	
//	// 회원가입 아이디 체크
//	public int checkOverId(String userId) {
//		String statement = "mybook.my.book.dao.MemberDAO.checkOverId";
//		return session.selectOne(statement,	userId);
//	}
//
//	// 회원 로그아웃
//	public void signout(SessionStatus session) {
//		session.setComplete();
//	}
//
//	// 아이디 찾기
//	public String find_id(String userName) {
//		String statement = "mybook.my.book.dao.MemberDAO.find_id";
//		return session.selectOne(statement, userName);
//	}
//	
//	// 비밀번호 찾기
//	public String find_pw(MemberVO vo) {
//		String statement = "mybook.my.book.dao.MemberDAO.find_pw";
//		return session.selectOne(statement, vo);
//	}	
//	
//	// 임시 비밀번호 저장
//	public void tmp_pw(MemberVO vo) {
//		String statement = "mybook.my.book.dao.MemberDAO.tmp_pw";
//		session.update(statement, vo);
//	}
//	
//	// 회원 탈퇴
//	public boolean withdrawal(String userId) {
//		boolean result = true;
//		String statement = "mybook.my.book.dao.MemberDAO.withdrawal";
//		if(session.delete(statement, userId)!=1) {
//			result = false;
//		}
//		return result;
//	}
//	
//	// 회원 정보 수정
//	public boolean updateMember(MemberVO vo) {
//		boolean result = true;
//		String statement = "mybook.my.book.dao.MemberDAO.updateMember";
//		if(session.update(statement, vo) != 1) {
//			result = false;
//		}
//		return result;
//	}
}