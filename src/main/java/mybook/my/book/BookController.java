package mybook.my.book;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import model.MyBookList;
import service.NaverBookService;

@Controller
@SessionAttributes("status")
public class BookController {
	@Autowired
	private NaverBookService service;
	
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
				}
			}else {
				//insert
				if(model.getTitle()!=null && model.getTitle()!=null && 
						model.getPublisher()!=null && model.getImage()!=null 
						&& model.getM_title()!=null && model.getM_star()!=null && model.getM_content()!=null) {
						boolean result = service.insert(model);
						if(result) 
							mav.addObject("msg", "mybooklist insert 성공");
						else
							mav.addObject("msg", "mybooklist insert 실패");
				}
			}
		}
	
		mav.addObject("list", service.listAll("qwe@gmail.com")); 
		mav.setViewName("readBook");
		return mav;
	}

	@RequestMapping(value = {"/interestBook"}, method=RequestMethod.GET) 
	public String interestBook() {
		return "interestBook";
	}
}

