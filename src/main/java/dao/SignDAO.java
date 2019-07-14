package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.MemberVO;

@Repository
public class SignDAO {
	@Autowired
	SqlSession session = null;	
	
	// 회원가입
	public boolean signup(MemberVO vo) {
		boolean result=true;
		String statement = "resource.MemberMapper.signup";
		if(session.insert(statement, vo) != 1)
			result = false;
		return result;
	}
	// 로그인
	public MemberVO signin(MemberVO vo) {
		MemberVO member = null;
		String statement = "resource.MemberMapper.signin";
		member = session.selectOne(statement, vo.getUserId());
		if(member == null || member.getUserPass().equals("password"))
			return null;			
		return member;
	}
}
