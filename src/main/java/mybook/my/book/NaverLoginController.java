package mybook.my.book;
import java.io.IOException;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
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

import com.github.scribejava.core.model.OAuth2AccessToken;

import service.MemberService;
import vo.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes({"status", "result"})
public class NaverLoginController {
	@Inject
	private MemberService service;
	@Inject
	PasswordEncoder passwordEncoder;
	
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/naver/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws Exception {
//		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
	    apiResult = naverLoginBO.getUserProfile(oauthToken);
//		model.addAttribute("result", apiResult);
	    
		//2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		
		//3. 데이터 파싱
		//Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject)jsonObj.get("response");
		
		//response의 nickname값 파싱
		String nickname = (String)response_obj.get("nickname");
		String email = (String)response_obj.get("email");

		MemberVO vo = new MemberVO();
		MemberVO userVO = new MemberVO();
		vo.setUserId(email);
		vo.setUserName(nickname);
		vo.setUserPass(passwordEncoder.encode("null"));
		userVO = service.viewMember(vo);
		if(userVO == null) {
			service.signup(vo);						
		}
		model.addAttribute("status", vo);		
		
		//4.파싱 닉네임 세션으로 저장
//		session.setAttribute("sessionId",nickname); //세션 생성
//		model.addAttribute("result", apiResult);

		/* 네이버 로그인 성공 페이지 View 호출 */
		return "redirect:/";
	}
}

