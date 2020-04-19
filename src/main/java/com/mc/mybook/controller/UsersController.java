package com.mc.mybook.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mc.mybook.constants.PathConstants;
import com.mc.mybook.model.User;
import com.mc.mybook.service.UsersService;

@Controller
@RequestMapping("/" + PathConstants.USER_PATH)
public class UsersController {
	@Autowired
	private UsersService usersService;
	
	@GetMapping(PathConstants.CRUD_SIGNUP)
	public String signUp(Model model, HttpSession session) {
		return PathConstants.USER_PATH + PathConstants.CRUD_SIGNUP;
	}
	
	@PostMapping(PathConstants.CRUD_SIGNUP)
	public String signUp(@ModelAttribute User user, HttpSession session) {
		String viewName = "redirect:/" + PathConstants.BOOK_PATH;
		user = usersService.addUser(user);
		session.setAttribute("user", user);
		return viewName;
	}
//	
//	// 회원가입 : 서비스 객체에 저장
//	@RequestMapping(value="/signUp", method=RequestMethod.POST)
//	public ModelAndView signUp(@ModelAttribute MemberVO vo, Model model, HttpSession session) throws Exception {
//		ModelAndView mav = new ModelAndView();
//		String viewName = null;
////		String encPassword = passwordEncoder.encode(vo.getUserPass());
////		vo.setUserPass(encPassword);
//		vo.setUserPass(vo.getUserPass());
//		if(service.signup(vo)) {
//			mav.addObject("status", vo);
//			mav.addObject("list", serviceBook.trendingbook()); 
//			mav.addObject("listLog", serviceBook.selectLog());
//			viewName = "redirect:/";
//		} else {
////			String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);		
////			model.addAttribute("url", naverAuthUrl);
//			mav.addObject("status", null);
//			viewName = "signUp";
//		}
//		mav.setViewName(viewName);
//		return mav;
//	}
	
	@GetMapping(PathConstants.CRUD_SIGNIN)
	public String signIn(Model model, HttpSession session) {
//		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);		
//		model.addAttribute("url", naverAuthUrl);
		return PathConstants.USER_PATH + PathConstants.CRUD_SIGNIN;
	}
	
	@PostMapping(PathConstants.CRUD_SIGNIN)
	public String signIn(@ModelAttribute User user, HttpSession session) {
		String viewName;
		user = usersService.findByLoginIdAndPassword(user);
		if(user == null) {
			viewName = PathConstants.USER_PATH + PathConstants.CRUD_SIGNIN;
		} else {
			session.setAttribute("user", user);
			viewName = "redirect:/" + PathConstants.BOOK_PATH;
		}
		return viewName;
	}
	
//	// 로그인 : 객체 정보를 추출해 세션에 저장, 암호화, 복호화 비교후 이동
//	@RequestMapping(value="/signIn", method=RequestMethod.POST)
//	public ModelAndView signIn(@ModelAttribute MemberVO vo, Model model, HttpServletResponse response, HttpSession session) throws Exception {
//		ModelAndView mav = new ModelAndView();
//		String viewName  =null;
//		String pw = vo.getUserPass();
////		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);		
////		model.addAttribute("url", naverAuthUrl);
//		vo = service.viewMember(vo);
//		if(vo == null) {
//			viewName="signIn";
//		} else {
////			boolean result = passwordEncoder.matches(pw, vo.getUserPass());
//			boolean result = pw.equals(vo.getUserPass());
//			if(result) {
//				mav.addObject("status", vo);
//				mav.addObject("list", serviceBook.trendingbook()); 
//				mav.addObject("listLog", serviceBook.selectLog());
//				viewName = "redirect:/";
//			} else {
//				mav.addObject("status", null);
//				mav.addObject("msg", "로그인 정보를 확인해주세요!!");
//				viewName = "signIn";
//				response.setContentType("text/html; charset=UTF-8");
//				PrintWriter out = response.getWriter();
//				out.print("<script>alert('로그인 정보를 확인해 주세요!!');</script>");
//				out.flush();
//			}			
//		}
//		mav.setViewName(viewName);
//		return mav;
//	}
	
	@PostMapping(PathConstants.CRUD_SIGNOUT)
	public String signOut(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}
	
	// 회원 수정  페이지 이동
	@GetMapping(PathConstants.CRUD_MYPAGE)
	public String  infoUpdate() throws Exception {
		return PathConstants.BOOK_PATH + PathConstants.CRUD_MYPAGE;
	}
	
//	// 회원 수정
//	@RequestMapping(value="/myPage", method=RequestMethod.POST)
//	public ModelAndView infoUpdate(@ModelAttribute MemberVO vo, @SessionAttribute("status")MemberVO member, Log log) throws Exception {
//		ModelAndView mav = new ModelAndView();
//		String userId = member.getUserId();
//		vo.setUserId(userId);
////		vo.setUserPass(passwordEncoder.encode(vo.getUserPass()));
//		vo.setUserPass(vo.getUserPass());
//		boolean result = service.updateMember(vo);
//		//log테이블 userName 수정
//		log.setEmail(userId);
//		log.setUserName(vo.getUserName());
//		serviceBook.updateUserName(log);
//		if(result) {
//			member = vo;
//			mav.addObject("status", member);
//		}
//		mav.setViewName("myPage");
//		return mav;
//	}
	
	// 회원탈퇴 페이지 이동
	@GetMapping(PathConstants.CRUD_WITHDRAWAL)
	public String withdrawal() {
		return PathConstants.BOOK_PATH + PathConstants.CRUD_WITHDRAWAL;
	}
	
//	// 회원탈퇴
//	@RequestMapping(value="/withdrawal", method=RequestMethod.POST)
//	public ModelAndView  withdrawal(@RequestParam("checkPass")String checkPass, @ModelAttribute MyBookList model, 
//			@SessionAttribute("status")MemberVO user, SessionStatus sessionClear, HttpServletResponse response) throws Exception {
//		ModelAndView mav = new ModelAndView();
//		String viewName = "";
////		boolean passCheck = passwordEncoder.matches(checkPass, user.getUserPass());
//		boolean passCheck = checkPass.equals(user.getUserPass());
//		if(!passCheck) {
//			response.setContentType("text/html; charset=UTF-8");
//			PrintWriter out = response.getWriter();
//			out.print("<script>alert('비밀번호가 다릅니다. 다시 확인해주세요!!');</script>");
//			out.flush();
//			viewName = "withdrawal";
//		} else {
//			String userId = user.getUserId();
//			boolean result = service.withdrawal(userId); 
//			if(result) {
//				serviceBook.deleteAll(userId);
//				serviceBook.deleteAllInterestBook(userId);
//				sessionClear.setComplete();
//				viewName = "redirect:/";
//			}
//		}
//		mav.setViewName(viewName);
//		return mav;
//	}
	
	// 아이디/비밀번호 찾기 페이지로 이동
	@GetMapping(PathConstants.CRUD_SEARCH)
	public String searchId() {
		return PathConstants.USER_PATH + PathConstants.CRUD_SEARCH;
	}
	
}
