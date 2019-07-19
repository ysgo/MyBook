package mybook.my.book;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import model.MyBookList;
import service.NaverBookService;
import vo.MemberVO;
import vo.PagingVO;

@Controller
@SessionAttributes("status")
public class BookController {
	@Autowired
	private NaverBookService service;
	
	@RequestMapping(value = {"/readBook"}) 
	public ModelAndView  readBook(@RequestParam(required=false)String keyword, String bookNum,
			@ModelAttribute MyBookList model, @SessionAttribute("status")MemberVO loginVO,
			@RequestParam(defaultValue="1")int curPage) {
		ModelAndView mav = new ModelAndView(); 
		String userId = loginVO.getUserId();
//		System.out.println(pageList.getBookNum() + " " + pageList.getKeyword());
		if(keyword != null) { 
			mav.addObject("bookList", service.searchBook(keyword, 10, 1)); //Open Api를 통해 찾은 값을 list형식으로 보내준다.
		}else {
			model.setEmail(userId);
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
					boolean result = service.delete(model);
					if(result) {
						mav.addObject("msg", "mybooklist delete 성공");
					} else {
						mav.addObject("msg", "mybooklist delete 실패");						
					}
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
		// selectAll & paging
		int listCnt = service.getTotalCnt(userId);
		PagingVO pageList = new PagingVO(listCnt, curPage);
		model.setStart(pageList.getStartIndex());
		model.setLast(pageList.getEndIndex());
		List<MyBookList> list = service.listAll(model);
		mav.addObject("list", list); 
//		mav.addObject("listCnt", listCnt);
		mav.addObject("pagination", pageList);
		mav.setViewName("readBook");
		return mav;
	}

	@RequestMapping(value = {"/interestBook"}, method=RequestMethod.GET) 
	public String interestBook() {
		return "interestBook";
	}
}

