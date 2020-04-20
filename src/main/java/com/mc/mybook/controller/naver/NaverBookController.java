package com.mc.mybook.controller.naver;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mc.mybook.constants.NaverPathConstants;
import com.mc.mybook.model.books.Book;
import com.mc.mybook.service.naver.NaverBookApiService;

@RestController
@RequestMapping("/" + NaverPathConstants.NAVER_PATH)
public class NaverBookController {
	@Autowired
	private NaverBookApiService naverBookApiService;
	
	@GetMapping(NaverPathConstants.NAVER_SEARCH)
	public ResponseEntity<List<Book>> searchBook(String keyword) {
		// keyword, display(출력 건수), start(최대 1000), sort(sim:유사도순, date:날짜순) 순서
		List<Book> books = naverBookApiService.searchBook(keyword, 10, 1, "sim");
		return new ResponseEntity<List<Book>>(books, HttpStatus.OK);
	}
}
