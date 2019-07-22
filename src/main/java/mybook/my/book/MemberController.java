package mybook.my.book;

import java.util.List;

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

import model.InterestBookList;
import model.Log;
import model.MyBookList;
import service.MemberService;
import service.NaverBookService;
import vo.MemberVO;
import vo.PagingVO;

@Controller
@SessionAttributes("status")
public class MemberController {
	@Inject
	private MemberService service;
	@Inject
	private NaverBookService serviceBook;
	
	@RequestMapping(value = "/")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("listLog", serviceBook.selectLog());
		mav.addObject("list", serviceBook.trendingbook()); 
		mav.setViewName("main");
		return mav;
	}
	
	@RequestMapping(value = "/otherReadBook")
	public ModelAndView otherReadBook(@RequestParam(defaultValue="1")int curPage,
			@ModelAttribute MyBookList model, String email) {
		ModelAndView mav = new ModelAndView();
		int listCnt = serviceBook.getTotalCnt(email);
		PagingVO pageList = new PagingVO(listCnt, curPage);
		model.setStart(pageList.getStartIndex());
		model.setLast(pageList.getEndIndex());
		model.setEmail(email);
		List<MyBookList> list = serviceBook.listAll(model);
		mav.addObject("list", list); 
		
		mav.addObject("pagination", pageList);	
		mav.setViewName("otherReadBook");
		return mav;
	}

	
	@RequestMapping(value = "/otherInterestBook")
	public ModelAndView otherInterestBook(String email) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", serviceBook.listAllInterestBook(email)); 
		mav.setViewName("otherInterestBook");
		return mav;
	}
	
	@RequestMapping(value = "/allLog")
	public ModelAndView allLog() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("listLog", serviceBook.selectLog()); 
		mav.setViewName("allLog");
		return mav;
	}
	
	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public String signUp() {
		return "signUp";
	}
	
	@RequestMapping(value="/signUp", method=RequestMethod.POST)
	public ModelAndView signUp(@ModelAttribute MemberVO vo) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = null;
		if(service.signup(vo)) {
			mav.addObject("status", vo);
			mav.addObject("list", serviceBook.trendingbook()); 
			mav.addObject("listLog", serviceBook.selectLog());
			viewName = "main";
		} else {
			mav.addObject("status", null);
			viewName = "signUp";
		}
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value = "/signIn", method = RequestMethod.GET)
	public String  signIn() {
		return "signIn";
	}
	
	@RequestMapping(value="/signIn", method=RequestMethod.POST)
	public ModelAndView signIn(@ModelAttribute MemberVO vo) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName  =null;
		boolean result = service.loginCheck(vo);
		if(result) {
			vo = service.viewMember(vo);
			mav.addObject("status", vo);
			mav.addObject("list", serviceBook.trendingbook()); 
			mav.addObject("listLog", serviceBook.selectLog());

			viewName = "main";
		} else {
			mav.addObject("status", null);
			viewName = "signIn";
		}
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value="/signOut", method=RequestMethod.GET)
	public String  signOut(SessionStatus session) throws Exception {
		service.signout(session);
		return "redirect:/";
	}
	
	@RequestMapping(value="/myPage", method=RequestMethod.GET)
	public String  infoUpdate() throws Exception {
		return "myPage";
	}
	
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
	
	@RequestMapping(value="/withdrawal", method=RequestMethod.GET)
	public String withdrawal() {
		return "withdrawal";
	}
	
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
