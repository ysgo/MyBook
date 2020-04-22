package com.mc.mybook.controller.books;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.mc.mybook.constants.PathConstants;
import com.mc.mybook.model.books.Log;
import com.mc.mybook.service.books.LogsService;

//import mybook.my.book.service.NaverBookService;
//import mybook.my.book.vo.Log;
//import mybook.my.book.vo.MyBookList;
//import mybook.my.book.vo.PagingVO;

@Controller
@SessionAttributes("status")
@RequestMapping("/" + PathConstants.LOG_PATH)
public class LogsController {
//	@Autowired
//	private NaverBookService serviceBook;
	@Autowired
	private LogsService logsService;
	
	@GetMapping
	public String logTotalPage(HttpSession session) {
		session.setAttribute("logs", logsService.listAll());
		return PathConstants.BOOK_PATH + PathConstants.CRUD_ALLLOG;
	}
	
	@PostMapping
	public Log addLog(Log log) {
		log = logsService.addLog(log);
		return log;
	}
	
	@RequestMapping(value = "/otherReadBook")
	public ModelAndView otherReadBook() {
		ModelAndView mav = new ModelAndView();
//		if(readkeyword != null) {
//			Map<String, String> map = new HashMap<String, String>();
//	        map.put("readkeyword", readkeyword);
//	        map.put("email", email);
//			mav.addObject("list", serviceBook.searchReadbook(map)); 
//			mav.setViewName("otherReadBook");
//			return mav;	
//		}
//		int listCnt = serviceBook.getTotalCnt(email);
//		PagingVO pageList = new PagingVO(listCnt, curPage);
//		model.setStart(pageList.getStartIndex());
//		model.setLast(pageList.getEndIndex());
//		model.setEmail(email);
//		List<MyBookList> list = serviceBook.listAll(model);
//		mav.addObject("list", list); 
//		mav.addObject("listCnt", listCnt);
//		mav.addObject("pagination", pageList);	
		mav.setViewName("otherReadBook");
		return mav;
	}
	
	@RequestMapping(value = "/otherInterestBook")
	public ModelAndView otherInterestBook(String email,  String interestkeyword) {
		ModelAndView mav = new ModelAndView();
//		if(interestkeyword != null) {
//			Map<String, String> map = new HashMap<String, String>();
//	        map.put("interestkeyword", interestkeyword);
//	        map.put("email", email);
//
//			mav.addObject("list", serviceBook.searchInterestbook(map)); 
//			mav.addObject("total", serviceBook.countInterestBook(email));
//			mav.setViewName("otherInterestBook");
//			return mav;	
//		}
//		
//		mav.addObject("list", serviceBook.listAllInterestBook(email)); 
//		// interestBook list rendering
//		mav.addObject("total", serviceBook.countInterestBook(email));
		mav.setViewName("otherInterestBook");
		return mav;
	}
	
	@RequestMapping(value = "/allLog")
	public ModelAndView allLog(@ModelAttribute Log model, @RequestParam(defaultValue="1")int curPage) {
		ModelAndView mav = new ModelAndView();
//		// 전체 로그게시글 수 받아야함 
//		int listCnt = serviceBook.getTotalCntLog();
//		PagingVO pageList = new PagingVO(listCnt, curPage);
//		model.setStart(pageList.getStartIndex());
//		model.setLast(pageList.getEndIndex());
//		List<Log> list = serviceBook.selectTotalLog(model);
//		mav.addObject("listLog", list); 
//		mav.addObject("listCnt", listCnt);
//		mav.addObject("pagination", pageList); 			
		mav.setViewName("allLog");
		return mav;
	}
}
