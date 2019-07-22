package mybook.my.book;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.social.google.connect.GoogleConnectionFactory;
//import org.springframework.social.oauth2.GrantType;
//import org.springframework.social.oauth2.OAuth2Operations;
//import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes({"url", "result"})
public class NaverLoginController {

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	//로그?�� �? ?���? ?���? 메소?��
	@RequestMapping(value = "/naver/login.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView login(Model model, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("?��?���?:" + naverAuthUrl);
		
		//네이버 
		mav.addObject("url", naverAuthUrl);
//		model.addAttribute("url", naverAuthUrl);
		mav.setViewName("signIn");
		/* 생성한 인증 URL을 View로 전달 */
		return mav;
	}
 
	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/naver/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException {
		System.out.println("?��기는 callback");
		OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //로그?�� ?��?��?�� ?��보�?? ?��?��?��?��.
	    apiResult = naverLoginBO.getUserProfile(oauthToken);
		model.addAttribute("result", apiResult);

        /* 네이버 로그인 성공 페이지 View 호출 */
		return "main";
	}
}

