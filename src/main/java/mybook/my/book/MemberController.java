package mybook.my.book;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
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
@SessionAttributes({"status", "userId", "userName"})
public class MemberController {
	@Inject
	private MemberService service;
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	// main 페이지 이동 
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		return mav;
	}
	
	
	// 회원가입 페이지 이동
	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public ModelAndView signUp() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("signUp");
		return mav;
	}
	
	// 회원가입 : 서비스 객체에 저장
	@RequestMapping(value="/signUp", method=RequestMethod.POST)
	public ModelAndView signUp(@ModelAttribute MemberVO vo, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = null;
		if(service.signup(vo, session)) {
			mav.addObject("status", vo);
			viewName = "main";
		} else {
			mav.addObject("status", null);
			viewName = "signUp";
		}
		mav.setViewName(viewName);
		return mav;
	}
	
	// 로그인 페이지 이동
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public ModelAndView  signIn() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("signIn");
		return mav;
	}
	
	// 로그인 : 객체 정보를 추출해 세션에 저장, 비교후 이동
	@RequestMapping(value="/signin", method=RequestMethod.POST)
	public ModelAndView signIn(@ModelAttribute MemberVO vo, HttpSession session) throws Exception {
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
	public ModelAndView  signOut(SessionStatus session) throws Exception {
		service.signout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		return mav;
	}
	
	// 회원 수정
	@RequestMapping(value="/updateMember", method=RequestMethod.GET)
	public ModelAndView  infoUpdate() throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myPage");
		return mav;
	}
	// 회원 수정
	@RequestMapping(value="/updateMember", method=RequestMethod.POST)
	public ModelAndView infoUpdate(@ModelAttribute MemberVO vo, HttpSession session, SessionStatus s) throws Exception {
		ModelAndView mav = new ModelAndView();
		boolean result = service.updateMember(vo);
		if(result) {
			mav.addObject("userName", vo.getUserName());
		}
		mav.setViewName("myPage");
		return mav;
	}
	
	// 회원탈퇴 페이지 이동
	@RequestMapping(value="/withdrawal", method=RequestMethod.GET)
	public ModelAndView withdrawal() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("withdrawal");
		return mav;
	}
	
	// 회원탈퇴
	@RequestMapping(value="/withdrawal", method=RequestMethod.POST)
	public String  withdrawal(HttpSession session, SessionStatus sessionClear, @RequestParam("checkPass")String checkPass) throws Exception {
		if(!checkPass.equals(session.getAttribute("userPass"))) {
			return "redirect:withdrawal";
		} else {
			boolean result = service.withdrawal((String)session.getAttribute("userId")); 
			if(result) {
				sessionClear.setComplete();
			}
		}
		return "redirect:/";
	}
}
