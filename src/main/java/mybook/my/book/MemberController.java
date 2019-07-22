package mybook.my.book;

import javax.inject.Inject;

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
	
	// main ?占쏙옙?占쏙옙占�? ?占쏙옙?占쏙옙 
	/*
	 * @RequestMapping(value = "/") public String main() { return "main"; }
	 */
	
	
	// ?占쏙옙?占쏙옙占�??占쏙옙 ?占쏙옙?占쏙옙占�? ?占쏙옙?占쏙옙
	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public String signUp() {
		return "signUp";
	}
	
	// ?占쏙옙?占쏙옙占�??占쏙옙 : ?占쏙옙鍮꾩뒪 媛앹껜?占쏙옙 ???占쏙옙
	@RequestMapping(value="/signUp", method=RequestMethod.POST)
	public ModelAndView signUp(@ModelAttribute MemberVO vo) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = null;
		if(service.signup(vo)) {
			mav.addObject("status", vo);
			mav.addObject("list", serviceBook.trendingbook()); 
			viewName = "main";
		} else {
			mav.addObject("status", null);
			viewName = "signUp";
		}
		mav.setViewName(viewName);
		return mav;
	}
	
	// 濡쒓렇?占쏙옙 ?占쏙옙?占쏙옙占�? ?占쏙옙?占쏙옙
	@RequestMapping(value = "/signIn", method = RequestMethod.GET)
	public String  signIn() {
		return "signIn";
	}
	
	// 濡쒓렇?占쏙옙 : 媛앹껜 ?占쏙옙蹂댐옙?? 異붿텧?占쏙옙 ?占쏙옙?占쏙옙?占쏙옙 ???占쏙옙, 鍮꾧탳?占쏙옙 ?占쏙옙?占쏙옙
	@RequestMapping(value="/signIn", method=RequestMethod.POST)
	public ModelAndView signIn(@ModelAttribute MemberVO vo) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName  =null;
		boolean result = service.loginCheck(vo);
		if(result) {
			vo = service.viewMember(vo);
			mav.addObject("status", vo);
			mav.addObject("list", serviceBook.trendingbook()); 
			viewName = "main";
		} else {
			mav.addObject("status", null);
			viewName = "signIn";
		}
		mav.setViewName(viewName);
		return mav;
	}
	
	// 濡쒓렇?占쏙옙?占쏙옙 
	@RequestMapping(value="/signOut", method=RequestMethod.GET)
	public String  signOut(SessionStatus session) throws Exception {
		service.signout(session);
		return "redirect:/";
	}
	
	// ?占쏙옙?占쏙옙 ?占쏙옙?占쏙옙  ?占쏙옙?占쏙옙占�? ?占쏙옙?占쏙옙
	@RequestMapping(value="/myPage", method=RequestMethod.GET)
	public String  infoUpdate() throws Exception {
		return "myPage";
	}
	
	// ?占쏙옙?占쏙옙 ?占쏙옙?占쏙옙
	@RequestMapping(value="/myPage", method=RequestMethod.POST)
	public ModelAndView infoUpdate(@ModelAttribute MemberVO vo, @SessionAttribute("status")MemberVO member) throws Exception {
		ModelAndView mav = new ModelAndView();
		boolean result = service.updateMember(vo);
		member = vo;
		if(result) {
			mav.addObject("status", member);
		}
		mav.setViewName("myPage");
		return mav;
	}
	
	// ?占쏙옙?占쏙옙?占쏙옙?占쏙옙 ?占쏙옙?占쏙옙占�? ?占쏙옙?占쏙옙
	@RequestMapping(value="/withdrawal", method=RequestMethod.GET)
	public String withdrawal() {
		return "withdrawal";
	}
	
	// ?占쏙옙?占쏙옙?占쏙옙?占쏙옙
	@RequestMapping(value="/withdrawal", method=RequestMethod.POST)
	public String  withdrawal(@RequestParam("checkPass")String checkPass, @ModelAttribute MyBookList model, 
			@SessionAttribute("status")MemberVO user, SessionStatus sessionClear) throws Exception {
		String userId = user.getUserId();
		if(!checkPass.equals(user.getUserPass())) {
			return "redirect:withdrawal";
		} else {
			boolean result = service.withdrawal(userId); 
			if(result) {
//				email占�? delete ?占쏙옙占�? ?占쏙옙?占쏙옙
//				model.setEmail(userId);
//				int id = ""
//				serviceBook.delete(model);
				sessionClear.setComplete();
			}
		}
		return "redirect:/";
	}
}
