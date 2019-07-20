package mybook.my.book;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import model.MyBookList;
import service.MemberService;
import service.NaverBookService;
import vo.MemberVO;

@Controller
@SessionAttributes("status")
public class MemberController {
	@Inject
	private MemberService service;
	@Inject
	private NaverBookService serviceBook;
	@Inject
	PasswordEncoder passwordEncoder;
	
	// main 페이지 이동 
	@RequestMapping(value = "/")
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
		String viewName = null;
		String encPassword = passwordEncoder.encode(vo.getUserPass());
		vo.setUserPass(encPassword);
		if(service.signup(vo)) {
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
	@RequestMapping(value = "/signIn", method = RequestMethod.GET)
	public String  signIn() {
		return "signIn";
	}
	
	// 로그인 : 객체 정보를 추출해 세션에 저장, 암호화, 복호화 비교후 이동
	@RequestMapping(value="/signIn", method=RequestMethod.POST)
	public ModelAndView signIn(@ModelAttribute MemberVO vo, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName  =null;
		String pw = vo.getUserPass();
		vo = service.viewMember(vo);
		if(vo == null) {
			viewName="signIn";
		} else {
			boolean result = passwordEncoder.matches(pw, vo.getUserPass());
			if(result) {
				mav.addObject("status", vo);
				viewName = "main";
			} else {
				mav.addObject("status", null);
				mav.addObject("msg", "로그인 정보를 확인해주세요!!");
				viewName = "signIn";
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('로그인 정보를 확인해 주세요!!');</script>");
				out.flush();
			}			
		}
		mav.setViewName(viewName);
		return mav;
	}
	
	// 로그아웃 
	@RequestMapping(value="/signOut", method=RequestMethod.POST)
	public String  signOut(SessionStatus session) throws Exception {
		service.signout(session);
		return "redirect:/";
	}
	
	// 회원 수정  페이지 이동
	@RequestMapping(value="/myPage", method=RequestMethod.GET)
	public String  infoUpdate() throws Exception {
		return "myPage";
	}
	
	// 회원 수정
	@RequestMapping(value="/myPage", method=RequestMethod.POST)
	public ModelAndView infoUpdate(@ModelAttribute MemberVO vo, @SessionAttribute("status")MemberVO member) throws Exception {
		ModelAndView mav = new ModelAndView();
		String userId = member.getUserId();
		vo.setUserId(userId);
		vo.setUserPass(passwordEncoder.encode(vo.getUserPass()));
		boolean result = service.updateMember(vo);
		if(result) {
			member = vo;
			mav.addObject("status", member);
		}
		mav.setViewName("myPage");
		return mav;
	}
	
	// 회원탈퇴 페이지 이동
	@RequestMapping(value="/withdrawal", method=RequestMethod.GET)
	public String withdrawal() {
		return "withdrawal";
	}
	
	// 회원탈퇴
	@RequestMapping(value="/withdrawal", method=RequestMethod.POST)
	public String  withdrawal(@RequestParam("checkPass")String checkPass, @ModelAttribute MyBookList model, 
			@SessionAttribute("status")MemberVO user, SessionStatus sessionClear) throws Exception {
		String userId = user.getUserId();
		if(!checkPass.equals(user.getUserPass())) {
			return "redirect:withdrawal";
		} else {
			boolean result = service.withdrawal(userId); 
			if(result) {
				serviceBook.deleteAll(userId);
				serviceBook.deleteAllInterestBook(userId);
				sessionClear.setComplete();
			}
		}
		return "redirect:/";
	}
}
