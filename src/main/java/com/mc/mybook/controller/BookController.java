package com.mc.mybook.controller;
//
//import java.text.ParseException;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.SessionAttribute;
//import org.springframework.web.bind.annotation.SessionAttributes;
//import org.springframework.web.servlet.ModelAndView;
//
//import mybook.my.book.service.NaverBookService;
//import mybook.my.book.vo.InterestBookList;
//import mybook.my.book.vo.Log;
//import mybook.my.book.vo.MemberVO;
//import mybook.my.book.vo.MyBookList;
//import mybook.my.book.vo.PagingVO;
//
//@Controller
//@SessionAttributes("status")
//public class BookController {
//	@Autowired
//	private NaverBookService service;
//	
//	@RequestMapping(value = {"/readBook"}) 
//	public ModelAndView  readBook(@RequestParam(required=false)String keyword, @ModelAttribute MyBookList model, String bookNum, String readkeyword,
//			@SessionAttribute("status")MemberVO loginVO, @RequestParam(defaultValue="1")int curPage, Log logmodel) throws ParseException {
//		ModelAndView mav = new ModelAndView(); 
//		String userId = loginVO.getUserId();
//		String userName = loginVO.getUserName();
//		if(readkeyword != null) {
//			Map<String, String> map = new HashMap<String, String>();
//	        map.put("readkeyword", readkeyword);
//	        map.put("email", userId);
//
//			mav.addObject("list", service.searchReadbook(map)); 
//			mav.setViewName("redirect:/readBook");
//			return mav;	
//		}
//		
//		if(keyword != null) { 
//			mav.addObject("bookList", service.searchBook(keyword, 10, 1));
//		}else {
//			model.setEmail(userId);
//			
//			if(bookNum != null) {
//				if(model.getM_title()!=null && model.getM_star()!=null && model.getM_content()!=null) {
//					//update mybooklist
//					model.setId(Integer.parseInt(bookNum));
//					service.update(model);
//
//					//update log
//					logmodel.setId(Integer.parseInt(bookNum)+1);
//					logmodel.setLogregistdate(service.selectMyBookLastRegistDate());
//					logmodel.setIsupdate("y");
//					service.updateLog(logmodel);
//					
//				}else {
//					//delete mybooklist
//					service.delete(Integer.parseInt(bookNum));
//					
//					//delete log
//					service.deleteLog(Integer.parseInt(bookNum)+1);
//				} 			
//			}else if(bookNum == null && model.getTitle()!=null && model.getTitle()!=null && 
//				model.getPublisher()!=null && model.getImage()!=null 
//				&& model.getM_title()!=null && model.getM_star()!=null && model.getM_content()!=null) {
//
//				//insert mybooklist 
//				model.setUserName(userName);
//				service.insert(model);
//				
//				//insert log 
//				logmodel.setEmail(userId);
//				logmodel.setUserName(userName);
//				logmodel.setMyBookTitle(model.getTitle());
//				logmodel.setLogregistdate(service.selectMyBookLastRegistDate());
//				service.insertLog(logmodel);
//			}
//		}
//				//selectAll & paging
//				int listCnt = service.getTotalCnt(userId);
//				PagingVO pageList = new PagingVO(listCnt, curPage);
//				model.setStart(pageList.getStartIndex());
//				model.setLast(pageList.getEndIndex());
//				List<MyBookList> list = service.listAll(model);
//				mav.addObject("list", list); 
//				mav.addObject("listCnt", listCnt);
//				mav.addObject("pagination", pageList);				
//				mav.setViewName("readBook");
//		return mav;
//	}
//	
//	@RequestMapping(value = {"/interestBook"}) 
//	public ModelAndView interestBook(@RequestParam(required=false)String keyword, InterestBookList model, String bookNum, String interestkeyword,
//			@SessionAttribute("status")MemberVO loginVO, Log logmodel) throws ParseException {
//		ModelAndView mav = new ModelAndView(); 
//		String userId = loginVO.getUserId();
//		String userName = loginVO.getUserName();
//
//		if(interestkeyword != null) {
//			Map<String, String> map = new HashMap<String, String>();
//	        map.put("interestkeyword", interestkeyword);
//	        map.put("email", userId);
//
//			mav.addObject("list", service.searchInterestbook(map)); 
//			mav.addObject("total", service.countInterestBook(userId));
//			mav.setViewName("interestBook");
//			return mav;	
//		}
//		
//		if(keyword != null) { 
//			mav.addObject("bookList", service.searchBook(keyword, 10, 1)); 
//		}else {
//			model.setEmail(userId);
//			
//			if(bookNum != null) {
//				//delete interestBook
//				service.deleteInterestBook(Integer.parseInt(bookNum));
//				
//				//delete log
//				service.deleteLog(Integer.parseInt(bookNum)+1);
//			}else if(model.getTitle()!=null && model.getTitle()!=null && 
//					model.getPublisher()!=null && model.getDescription()!=null & model.getImage()!=null) {
//				
//				//insert interestBooklist 
//				service.insertInterestBook(model);
//				
//				//insert log
//				logmodel.setEmail(userId);
//				logmodel.setUserName(userName);
//				logmodel.setInterestBookTitle(model.getTitle());
//				logmodel.setLogregistdate(service.selectInterestLastRegistDate());
//				service.insertLog(logmodel);
//			}
//		}
//		mav.addObject("list", service.listAllInterestBook(userId)); 
//		// interestBook list rendering
//		mav.addObject("total", service.countInterestBook(userId));
//		mav.setViewName("interestBook");
//		return mav;
//	}
//	
//	@RequestMapping(value = {"/detailInterestBook"}) 
//	public ModelAndView detailInterestBook(String bookNum, String bookTitle) {
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("bookTitle", bookTitle);
//		mav.addObject("list", service.selectDetailInterestBook(Integer.parseInt(bookNum))); 
//		mav.setViewName("detailInterestBook");
//		return mav;
//	}
//	
//}
//
