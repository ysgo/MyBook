package mybook.my.book;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.InterestBookList;
import model.MyBookList;
import service.NaverBookService;

@Controller
public class BookController {
	@Autowired
	private NaverBookService service;
	
	@RequestMapping(value = {"/"}) 
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
	
	@RequestMapping(value = {"/readBook"}) 
	public ModelAndView  readBook(@RequestParam(required=false)String keyword, MyBookList model, String bookNum) {
		ModelAndView mav = new ModelAndView(); 
		if(keyword != null) { 
			mav.addObject("bookList", service.searchBook(keyword, 10, 1)); //Open Api를 통해 찾은 값을 list형식으로 보내준다.
		}else {
			model.setEmail("qwe@gmail.com");
			
			if(bookNum != null) {
				//update
				if(model.getM_title()!=null && model.getM_star()!=null && model.getM_content()!=null) {
					model.setId(Integer.parseInt(bookNum));
					boolean result = service.update(model);
					if(result) {
						mav.addObject("msg", "mybooklist update 성공");
					}
					else
						mav.addObject("msg", "mybooklist update 실패");
				}else {
					//delete
					boolean result = service.delete(Integer.parseInt(bookNum));
				} //insert				
			}else if(bookNum == null && model.getTitle()!=null && model.getTitle()!=null && 
				model.getPublisher()!=null && model.getImage()!=null 
				&& model.getM_title()!=null && model.getM_star()!=null && model.getM_content()!=null) {
				boolean result = service.insert(model);
				if(result) 
					mav.addObject("msg", "mybooklist insert 성공");
				else
					mav.addObject("msg", "mybooklist insert 실패");
			}
		}
		mav.addObject("list", service.listAll("qwe@gmail.com")); 
		mav.setViewName("readBook");
		return mav;
	}
	
	@RequestMapping(value = {"/interestBook"}) 
	public ModelAndView interestBook(@RequestParam(required=false)String keyword, InterestBookList model, String bookNum) {
		ModelAndView mav = new ModelAndView(); 
		if(keyword != null) { 
			mav.addObject("bookList", service.searchBook(keyword, 10, 1)); //Open Api를 통해 찾은 값을 list형식으로 보내준다.
		}else {
			model.setEmail("qwe@gmail.com");
			
			if(bookNum != null) {
				//delete
				boolean result = service.deleteInterestBook(Integer.parseInt(bookNum));
			}else if(model.getTitle()!=null && model.getTitle()!=null && 
					model.getPublisher()!=null && model.getDescription()!=null & model.getImage()!=null) {
				boolean result = service.insertInterestBook(model);
				if(result) 
					mav.addObject("msg", "InterestBookList insert 성공");
				else
					mav.addObject("msg", "InterestBookList insert 실패");
			}
		}
		mav.addObject("list", service.listAllInterestBook("qwe@gmail.com")); 
		mav.setViewName("interestBook");
		return mav;
	}
	
	@RequestMapping(value = {"/detailInterestBook"}) 
	public ModelAndView detailInterestBook(String bookNum, String bookTitle) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("bookTitle", bookTitle);
		mav.addObject("list", service.selectDetailInterestBook(Integer.parseInt(bookNum))); 
		mav.setViewName("detailInterestBook");
		return mav;
	}
	
	@RequestMapping(value = {"/myPage"}, method=RequestMethod.GET) 
	public String myPage() {
		return "myPage";
	}
}

