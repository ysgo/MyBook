package mybook.my.book;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import model.InterestBookList;
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
	public ModelAndView  readBook(@RequestParam(required=false)String keyword, @ModelAttribute MyBookList model, String bookNum, String readkeyword,
			@SessionAttribute("status")MemberVO loginVO, @RequestParam(defaultValue="1")int curPage) {
		ModelAndView mav = new ModelAndView(); 
		String userId = loginVO.getUserId();
		if(readkeyword != null) {
			Map<String, String> map = new HashMap<String, String>();
	        map.put("readkeyword", readkeyword);
	        map.put("email", userId);
	        
	        List<MyBookList> list = service.searchReadbook(map);
			mav.addObject("list", list); 
			mav.setViewName("readBook");
			return mav;	
		}
		if(keyword != null) { 
			mav.addObject("bookList", service.searchBook(keyword, 10, 1)); //Open Api를 통해 찾은 값을 list형식으로 보내준다
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
		
		// selectAll & paging
				int listCnt = service.getTotalCnt(userId);
				PagingVO pageList = new PagingVO(listCnt, curPage);
				model.setStart(pageList.getStartIndex());
				model.setLast(pageList.getEndIndex());
				List<MyBookList> list = service.listAll(model);
				mav.addObject("list", list); 
				mav.addObject("pagination", pageList);				
				mav.setViewName("readBook");
		return mav;
	}
	
	@RequestMapping(value = {"/interestBook"}) 
	public ModelAndView interestBook(@RequestParam(required=false)String keyword, @SessionAttribute("status")MemberVO loginVO,
			InterestBookList model, String bookNum, String interestkeyword) {
		ModelAndView mav = new ModelAndView(); 
		String userId = loginVO.getUserId();
		if(interestkeyword != null) {
			Map<String, String> map = new HashMap<String, String>();
	        map.put("interestkeyword", interestkeyword);
	        map.put("email", userId);

			mav.addObject("list", service.searchInterestbook(map)); 
			mav.setViewName("interestBook");
			return mav;	
		}
		
		if(keyword != null) { 
			mav.addObject("bookList", service.searchBook(keyword, 10, 1)); //Open Api를 통해 찾은 값을 list형식으로 보내준다
		}else {
			model.setEmail(userId);
			
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
		mav.addObject("list", service.listAllInterestBook(userId)); 
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
	
	@RequestMapping(value = {"/trendingbook"}, method=RequestMethod.GET) 
	public ModelAndView trendingbook() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", service.trendingbook()); 
		mav.setViewName("main");
		return mav;
	}
}

