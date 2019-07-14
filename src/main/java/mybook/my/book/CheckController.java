package mybook.my.book;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import service.MemberService;

@Controller
public class CheckController {
	@Autowired
	private MemberService service;
	
	// 이메일ID 체크기능
	@RequestMapping(value = "/idCheck12", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(String userId) {
		return service.userIdCheck(userId);
	}
	
	// 아이디/비밀번호 찾기
	@RequestMapping(value="/searchId", method=RequestMethod.GET)
	public ModelAndView searchId(String keyword) {
		ModelAndView mav = new ModelAndView();
		System.out.println(keyword);
		// 닉네임 검색이 있을 경우
		if(keyword != null) {
			mav.addObject("searchId", "");
		}
		mav.setViewName("searchId");
		return mav;
	}
}
