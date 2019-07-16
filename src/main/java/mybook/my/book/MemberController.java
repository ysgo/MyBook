package mybook.my.book;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import service.MemberService;
import vo.MemberVO;

@Controller
@SessionAttributes("status")
public class MemberController {
	@Inject
	private MemberService service;
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	// main 페이지 이동 
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
		return "main";
	}
	
	// 로그인 페이지 이동
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public String signin() {
		return "signIn";
	}
	
	// 회원가입 페이지 이동
	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public String signup() {
		return "signUp";
	}
	
	// 회원가입 : 암호화 저장 후 서비스 객체에 저장
	@RequestMapping(value="/signUp", method=RequestMethod.POST)
	public ModelAndView signUp(MemberVO vo) throws Exception {
		ModelAndView mav = new ModelAndView();
		String inputPass = vo.getUserPass();
		if(inputPass == null || !(inputPass.equals(vo.getUserPass()))) {
			mav.setViewName("signUp");
			return mav;
		}
		if(service.signup(vo)) {
			mav.addObject("status", "회원가입 성공");
		} else {
			mav.addObject("status", "가입 실패");
		}
		mav.setViewName("main");
		return mav;
	}
	
	// 로그인 : 객체 정보를 추출해 세션에 저장, 비교후 이동
	@RequestMapping(value="/signIn", method=RequestMethod.POST)
	public ModelAndView signIn(@ModelAttribute MemberVO vo, HttpSession session, 
			@CookieValue(value="userId", required=false) String userId) throws Exception {
		ModelAndView mav = new ModelAndView();

		boolean result = service.loginCheck(vo, session);
		if(result) {
			mav.addObject("status", "success");
			mav.setViewName("main");
		} else {
			mav.addObject("status", null);
			mav.setViewName("signIn");
		}
		return mav;
	}
	
	// 로그아웃 
	@RequestMapping(value="/signOut", method=RequestMethod.GET)
	public String signOut(SessionStatus session) throws Exception {
		service.signout(session);
		return "redirect:/";
	}
}
