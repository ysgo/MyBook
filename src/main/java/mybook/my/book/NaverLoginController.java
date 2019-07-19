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

import com.github.scribejava.core.model.OAuth2AccessToken;

/**
 * Handles requests for the application home page.
 */
@Controller
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
	public String login(Model model, HttpSession session) {
		
		/* ?��?��버아?��?���? ?���? URL?�� ?��?��?���? ?��?��?�� naverLoginBO?��?��?��?�� getAuthorizationUrl메소?�� ?���? */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("?��?���?:" + naverAuthUrl);
		
		//?��?���? 
		model.addAttribute("url", naverAuthUrl);

		/* ?��?��?�� ?���? URL?�� View�? ?��?�� */
		return "signIn";
	}
 
	//?��?���? 로그?�� ?��공시 callback?���? 메소?��
	@RequestMapping(value = "/naver/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException {
		System.out.println("?��기는 callback");
		OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //로그?�� ?��?��?�� ?��보�?? ?��?��?��?��.
	    apiResult = naverLoginBO.getUserProfile(oauthToken);
		model.addAttribute("result", apiResult);

        /* ?��?���? 로그?�� ?���? ?��?���? View ?���? */
		return "/naver/loginResult";
	}
}

