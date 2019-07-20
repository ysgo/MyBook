package mybook.my.book;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import service.MemberService;
import vo.MemberVO;

@Controller
public class CheckController {
	@Autowired
	private MemberService service; 
	@Inject
	PasswordEncoder passwordEncoder;
	
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
			@RequestParam("userId") String userId, @ModelAttribute MemberVO vo) {
		ModelAndView mav = new ModelAndView();
		String result = service.find_pw(vo);
		if(result == null) {
			result = "가입된 회원정보가 없습니다.";
		} else {
		  //배열에 선언 
			result = "";
			char pwCollection[] = new char[] { 
                    '1','2','3','4','5','6','7','8','9','0', 
                    'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z', 
                    'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'};

			for (int i = 0; i < 10; i++) { 
			    int selectRandomPw = (int)(Math.random()*(pwCollection.length));//Math.rondom()은 0.0이상 1.0미만의 난수를 생성해 준다. 
			    result += pwCollection[selectRandomPw]; 
			    vo.setUserPass(passwordEncoder.encode(result));
			    service.tmp_pw(vo);
		  } 

		}
		mav.addObject("searchPass", result);
		mav.setViewName("search_view");
		return mav;
	}
}
