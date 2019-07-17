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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import service.MemberService;
import vo.MemberVO;

@Controller
@SessionAttributes({"status", "userId", "userPass", "userName"})
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
	
	
	// 회원가입 페이지 이동
	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public String signUp() {
		return "signUp";
	}
	
	// 회원가입 : 서비스 객체에 저장
	@RequestMapping(value="/signUp", method=RequestMethod.POST)
	public ModelAndView signUp(@ModelAttribute MemberVO vo) throws Exception {
		ModelAndView mav = new ModelAndView();
		String inputPass = vo.getUserPass();
		if(inputPass == null || !(inputPass.equals(vo.getUserPass()))) {
			mav.setViewName("signUp");
			return mav;
		}
		if(service.signup(vo)) {
			mav.addObject("status", vo);
		} else {
			mav.addObject("status", null);
		}
		mav.setViewName("main");
		return mav;
	}
	
	// 로그인 페이지 이동
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public String signIn() {
		return "signIn";
	}
	
	// 로그인 : 객체 정보를 추출해 세션에 저장, 비교후 이동
	@RequestMapping(value="/signin", method=RequestMethod.POST)
	public ModelAndView signIn(@ModelAttribute MemberVO vo, HttpSession session, 
			@CookieValue(value="userId", required=false) String userId) throws Exception {
		ModelAndView mav = new ModelAndView();
		boolean result = service.loginCheck(vo, session);
		if(result) {
			mav.addObject("status", vo);
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
	
	// 회원 수정
	@RequestMapping(value="/updateMember", method=RequestMethod.GET)
	public String infoUpdate() throws Exception {
		return "redirect:/myPage";
	}
	// 회원 수정
	@RequestMapping(value="/updateMember", method=RequestMethod.POST)
	public String infoUpdate(@ModelAttribute MemberVO vo, HttpSession session) throws Exception {
		boolean result = service.updateMember(vo);
		if(result) {
			session.setAttribute("userName", vo.getUserName());
			session.setAttribute("userPass", vo.getUserPass());
		}
		return "myPage";
	}
	
	// 회원탈퇴
	@RequestMapping(value="/withdrawal", method=RequestMethod.GET)
	public String withdrawal() {
		return "withdrawal";
	}
	
	// 회원탈퇴
	@RequestMapping(value="/withdrawal", method=RequestMethod.POST)
	public String withdrawal(HttpSession session, SessionStatus sessionClear, @RequestParam("checkPass")String checkPass) throws Exception {
		if(!checkPass.equals(session.getAttribute("userPass"))) {
			return "redirect:/withdrawal";
		} else {
			boolean result = service.withdrawal((String)session.getAttribute("userId")); 
			if(result) {
				sessionClear.setComplete();
			}
		}
		return "redirect:/";
	}
}
