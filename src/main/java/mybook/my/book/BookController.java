package mybook.my.book;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import service.NaverBookService;

@Controller
public class BookController {
	@Autowired
	private NaverBookService service;
	
	@RequestMapping(value = {"/main","/signUp","/signIn","/readBook","/interestBook"}) 
	public ModelAndView bookList(@RequestParam(required=false)String keyword,String action, String id) {
		ModelAndView mav = new ModelAndView(); 
		if(id != null) {
			if(action.equals("signUp")) { 
				mav.setViewName("signUp");
				return mav;
			}else if(action.equals("signIn")) { 
				mav.setViewName("signIn");
				return mav;
			}if(action.equals("readBook")) { 
				mav.setViewName("readBook");
				return mav;
			}else if(action.equals("interestBook")) { 
				mav.setViewName("interestBook");
				return mav;
			}
		}else {
			/*아직 readBook.jsp에 구현안함*/
			if(keyword != null) {
				mav.addObject("bookList", service.searchBook(keyword, 10, 1)); 
				mav.setViewName("readBook");
			}
			else
				mav.setViewName("main");
		}
		return mav;
	}
}

