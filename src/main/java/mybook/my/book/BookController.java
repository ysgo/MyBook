package mybook.my.book;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import service.NaverBookService;

@Controller
public class BookController {
	@Autowired
	private NaverBookService service;
	
	@RequestMapping(value = {"/"}, method=RequestMethod.GET) 
	public String main() {
		return "main";
	}
	
	@RequestMapping(value = {"/signUp"}, method=RequestMethod.GET) 
	public String signUp() {
		return "signUp";
	}
	
	@RequestMapping(value = {"/signIn"}, method=RequestMethod.GET) 
	public String signIn() {
		return "signIn";
	}
	
	@RequestMapping(value = {"/readBook"}, method=RequestMethod.GET) 
	public String readBook() {
		return "readBook";
	}
	
	@RequestMapping(value = {"/interestBook"}, method=RequestMethod.GET) 
	public String interestBook() {
		return "interestBook";
	}
	
	@RequestMapping(value = {"/myPage"}, method=RequestMethod.GET) 
	public String myPage() {
		return "myPage";
	}
}

