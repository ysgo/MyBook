package com.mc.mybook.controller.books;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.mc.mybook.constants.PathConstants;
import com.mc.mybook.model.books.Book;
import com.mc.mybook.model.books.Log;
import com.mc.mybook.model.books.Review;
import com.mc.mybook.model.books.User;
import com.mc.mybook.service.books.BooksService;
import com.mc.mybook.service.books.LogsService;
import com.mc.mybook.service.books.ReviewsService;

@Controller
@RequestMapping("/" + PathConstants.BOOK_PATH)
public class BooksController {
//	@Autowired
//	private NaverBookService service;
	@Autowired
	private BooksService booksService;
	@Autowired
	private ReviewsService reviewsService;
	@Autowired
	private LogsService logsService;
	
	@GetMapping
	public String main(Model model) {
		return PathConstants.BOOK_PATH + PathConstants.CRUD_INDEX;
	}
	
	@GetMapping(PathConstants.CRUD_READBOOK)
	public String readBook(HttpSession session, @SessionAttribute("user") Optional<User> user) {
		if(user.isPresent()) {
			session.setAttribute("books", booksService.findAllByUserIdAndReviewIdNotNull(user.get().getId()));
		}
//		session.setAttribute("reviews", reviewsService.listAll());
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
		return PathConstants.BOOK_PATH + PathConstants.CRUD_READBOOK;
	}
	
	@PostMapping
	@ResponseBody
	public Book addReadBook(Book book, @SessionAttribute("user") Optional<User> user) {
		if(user.isPresent()) {
			book = booksService.save(book);
			Log log = new Log(user.get().getName(), book.getTitle(), book.getReview().getId());
			logsService.addLog(log);
		}
		return book;
	}
	
	@PutMapping("/delete/{id}")
	@ResponseBody
	public Book deleteBooksReview(@PathVariable("id") int id) {
		Book book = booksService.findById(id);
		book.setReview(null);
		booksService.save(book);
		return book;
	}
	
	@PutMapping
	@ResponseBody
	public Book editReadBook(Book book) {
		book = booksService.findById(book.getId());
		book.setReview(new Review());
		booksService.save(book);
		reviewsService.delete(book.getReview());
		return book;
	}
	
	@GetMapping(PathConstants.CRUD_INTERESTBOOK)
	public String interestBook(HttpSession session, @SessionAttribute("user") Optional<User> user) {
		if(user.isPresent()) {
			session.setAttribute("books", booksService.findAllByUserIdAndInterestedTrue(user.get().getId()));
		}
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
		return PathConstants.BOOK_PATH + PathConstants.CRUD_INTERESTBOOK;
	}
	
	@PostMapping(PathConstants.CRUD_INTERESTBOOK)
	@ResponseBody
	public Book addInterestBook(Book book, @SessionAttribute("user") Optional<User> user) {
		if(user.isPresent()) {
			Book checkBook = booksService.findTop1ByUserIdAndImageAndInterestedFalse(book.getUserId(), book.getImage());
			if(checkBook != null) {
				checkBook.setInterested(true);
				book = booksService.save(checkBook);
			} else {
				book = booksService.save(book);
			}
		}
		return book;
	}
	
	@GetMapping(PathConstants.CRUD_INTERESTBOOK + PathConstants.CRUD_DETAIL + "/{id}")
	public String detailInterestBook(HttpSession session, @PathVariable("id") int id) throws UnsupportedEncodingException {
		Book book = booksService.findById(id);
		String encodeBookTitle = book.getTitle().replaceAll("<(/)?([a-zA-Z]*)(\\\\s[a-zA-Z]*=[^>]*)?(\\\\s)*(/)?>", "");
		encodeBookTitle = URLEncoder.encode(encodeBookTitle, "EUC-KR");
		session.setAttribute("book", book);
		session.setAttribute("encodeBookTitle", encodeBookTitle);
		return PathConstants.BOOK_PATH + PathConstants.CRUD_DETAILINTERESTBOOK;
	}
	
}
