package mybook.my.book;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping(value="/searchId", method=RequestMethod.GET)
	public String searchId() {
		return "searchId";
	}
	
	// 아이디/비밀번호 찾기
	@RequestMapping(value="/searchId", method=RequestMethod.POST)
	public ModelAndView searchId(@RequestParam("keyword")String keyword) {
		ModelAndView mav = new ModelAndView();
		System.out.println(keyword);
		// 닉네임 검색이 있을 경우
		if(keyword != null) {
			mav.addObject("searchId", service.find_id(keyword));
		}
		mav.setViewName("searchId_view");
		return mav;
	}
}
