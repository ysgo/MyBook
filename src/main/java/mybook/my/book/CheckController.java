package mybook.my.book;

import java.util.HashMap;

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
	
	// 닉네임 체크기능
	@RequestMapping(value = "/nameCheck", method = RequestMethod.GET)
	@ResponseBody
	public int nameCheck(String userName) {
		return service.userNameCheck(userName);
	}
	// 이메일ID 체크기능
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(String userId) {
		return service.userIdCheck(userId);
	}
	// 아이디/비밀번호 찾기 페이지로 이동
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String searchId() {
		return "search";
	}
	// 아이디 찾기
	@RequestMapping(value="/searchId", method=RequestMethod.POST)
	public ModelAndView searchId(@RequestParam("userName")String userName) {
		ModelAndView mav = new ModelAndView();
		String result = service.find_id(userName);
		// 닉네임 검색이 있을 경우
		if(result == null) {
			result = "가입된 아이디가 없습니다.";
		}
		mav.addObject("searchId", result);
		mav.setViewName("search_view");
		return mav;
	}
	// 비밀번호 찾기
	@RequestMapping(value="/searchPass", method=RequestMethod.POST)
	public ModelAndView searchPass(@RequestParam("userName") String userName,
			@RequestParam("userId") String userId) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, String> hash = new HashMap<>();
		hash.put("userName", userName);
		hash.put("userId", userId);
		String result = service.find_pw(hash);
		if(result == null) {
			result = "가입된 회원정보가 없습니다.";
		}
		
		mav.addObject("searchPass", result);
		mav.setViewName("search_view");
		return mav;
	}
}
