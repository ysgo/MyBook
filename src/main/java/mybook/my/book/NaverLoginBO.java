package mybook.my.book;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.util.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

public class NaverLoginBO {

    /* ?���? ?���?문을 구성?��?�� ?��?��미터 */
	//client_id: ?��?��리�??��?�� ?���? ?�� 발급받�? ?��?��?��?��?�� ?��?��?��
	//response_type: ?���? 과정?�� ???�� 구분�?. code�? 값이 고정?�� ?��?��?��?��.
	//redirect_uri: ?��?���? 로그?�� ?��증의 결과�? ?��?��받을 콜백 URL(URL ?��코딩). ?��?��리�??��?��?�� ?��록할 ?�� Callback URL?�� ?��?��?�� ?��보입?��?��.
	//state: ?��?��리�??��?��?�� ?��?��?�� ?��?�� ?��?��
	private final static String CLIENT_ID = "Ch1Mh8atP6hvX2X5HGQM";
    private final static String CLIENT_SECRET = "_nng9isaQ0";
    private final static String REDIRECT_URI = "http://localhost:8000/book/naver/callback.do";
    private final static String SESSION_STATE = "oauth_state";
    /* ?��로필 조회 API URL */
    private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";
    
    /* ?��?���? ?��?��?���? ?���?  URL ?��?��  Method */
    public String getAuthorizationUrl(HttpSession session) {

        /* ?��?�� ?��?��?�� �?증을 ?��?��?�� ?��?���? ?��?�� */
        String state = generateRandomString();
        /* ?��?��?�� ?��?�� 값을 session?�� ???�� */
        setSession(session,state);        

        /* Scribe?��?�� ?��공하?�� ?���? URL ?��?�� 기능?�� ?��?��?��?�� ?��?���? ?���? URL ?��?�� */
        OAuth20Service oauthService = new ServiceBuilder()                                                   
                .apiKey(CLIENT_ID)
                .apiSecret(CLIENT_SECRET)
                .callback(REDIRECT_URI)
                .state(state) //?��?�� ?��?��?�� ?��?��값을 ?���? URL?��?��?�� ?��?��?��
                .build(NaverLoginApi.instance());

        return oauthService.getAuthorizationUrl();
    }

    /* ?��?��버아?��?���? Callback 처리 �?  AccessToken ?��?�� Method */
    public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException{

        /* Callback?���? ?��?��받�? ?��?���?증용 ?��?��값과 ?��?��?�� ???��?��?��?��?�� 값이 ?��치하?���? ?��?�� */
        String sessionState = getSession(session);
        if(StringUtils.pathEquals(sessionState, state)){

            OAuth20Service oauthService = new ServiceBuilder()
                    .apiKey(CLIENT_ID)
                    .apiSecret(CLIENT_SECRET)
                    .callback(REDIRECT_URI)
                    .state(state)
                    .build(NaverLoginApi.instance());

            /* Scribe?��?�� ?��공하?�� AccessToken ?��?�� 기능?���? ?��?���? Access Token?�� ?��?�� */
            OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
            return accessToken;
        }
        return null;
    }

    /* ?��?�� ?��?��?�� �?증을 ?��?�� ?��?�� ?��?���? */
    private String generateRandomString() {
        return UUID.randomUUID().toString();
    }

    /* http session?�� ?��?��?�� ???�� */
    private void setSession(HttpSession session,String state){
        session.setAttribute(SESSION_STATE, state);     
    }

    /* http session?��?�� ?��?��?�� �??��?���? */ 
    private String getSession(HttpSession session){
        return (String) session.getAttribute(SESSION_STATE);
    }
    /* Access Token?�� ?��?��?��?�� ?��?���? ?��?��?�� ?��로필 API�? ?���? */
    public String getUserProfile(OAuth2AccessToken oauthToken) throws IOException{

        OAuth20Service oauthService =new ServiceBuilder()
                .apiKey(CLIENT_ID)
                .apiSecret(CLIENT_SECRET)
                .callback(REDIRECT_URI).build(NaverLoginApi.instance());

            OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
        oauthService.signRequest(oauthToken, request);
        Response response = request.send();
        return response.getBody();
    }

}