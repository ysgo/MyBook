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
		return "signin";
	}
	
	// 회원가입 페이지 이동
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup() {
		return "signup";
	}
	
	// 회원가입 : 암호화 저장 후 서비스 객체에 저장
	@RequestMapping(value="/signup", method=RequestMethod.POST)
	public ModelAndView signUp(MemberVO vo) throws Exception {
		ModelAndView mav = new ModelAndView();
		String inputPass = vo.getUserPass();
//		String secPass = null;
		if(inputPass == null || !(inputPass.equals(vo.getUserPass()))) {
			mav.setViewName("signup");
			return mav;
		}
//		secPass = passEncoder.encode(inputPass);	// 비밀번호를 암호화
//		vo.setUserPass(secPass); // 암호화된 비밀번호를 secPass에 저장
		if(service.signup(vo)) {
			mav.addObject("status", "회원가입 성공");
		} else {
			mav.addObject("status", "가입 실패");
		}
		mav.setViewName("main");
		return mav;
	}
	
	// 로그인 : 객체 정보를 추출해 세션에 저장, 비교후 이동
	@RequestMapping(value="/signin", method=RequestMethod.POST)
	public ModelAndView signIn(@ModelAttribute MemberVO vo, HttpSession session, 
			@CookieValue(value="userId", required=false) String userId) throws Exception {
		System.out.println(userId);
		ModelAndView mav = new ModelAndView();

		boolean result = service.loginCheck(vo, session);
		if(result) {
			mav.addObject("status", "success");
			mav.setViewName("main");
		} else {
			mav.addObject("status", null);
			mav.setViewName("signin");
		}
		return mav;
//		MemberVO login = service.signin(vo);	// MemverVO형 변수 login에 로그인 정보를 저장
//		HttpSession session = req.getSession();  // 현재 세션 정보를 가져옴
//		// DB의 비밀번호와 입력된 비밀번호를 비교
//		boolean passMatch = passEncoder.matches(vo.getUserPass(), login.getUserPass());
//		System.out.println("test3");
//		if(login != null && passMatch) {
//			// 멤버세션 정보 부여
//			session.setAttribute("member", login);
//		} else { 		// 아이디 없고, 비밀번호 틀릴경우
//			session.setAttribute("member", null);  // member 세션에 null 부여  
//			rttr.addFlashAttribute("msg", false);  // 1회성인 변수인 msg에 false 부여
//			return "redirect:/signin";  // 로그인 화면으로 이동
//		}
//		return "redirect:/";
	}
	
	// 로그아웃 
	@RequestMapping(value="/signout", method=RequestMethod.GET)
	public String signOut(SessionStatus session) throws Exception {
		service.signout(session);
		return "redirect:/";
	}
}
