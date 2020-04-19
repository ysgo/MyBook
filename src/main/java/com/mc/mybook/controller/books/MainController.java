package com.mc.mybook.controller.books;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.mc.mybook.constants.PathConstants;

@Controller
public class MainController {
	@GetMapping
	public String main() {
		return "redirect:/" + PathConstants.BOOK_PATH;
	}
}
