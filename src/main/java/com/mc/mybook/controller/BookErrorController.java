package com.mc.mybook.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mc.mybook.constants.PathConstants;
import com.mc.mybook.exception.ErrorResponse;

@Controller
@RequestMapping(value = PathConstants.ERROR_PAGE)
public class BookErrorController implements ErrorController {
	public String handleError(HttpServletRequest request, Model model) {
		ErrorResponse errors = (ErrorResponse) request.getAttribute("errors");
		
		if(errors == null) {
			Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
			if(status != null) {
				Integer statusCode = Integer.valueOf(status.toString());
				if(statusCode == HttpStatus.NOT_FOUND.value()) {
					return PathConstants.ERROR_PATH + PathConstants.ERROR_PAGE + "-404";
				} else if(statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
					return PathConstants.ERROR_PATH + PathConstants.ERROR_PAGE + "-500";
				}
			} else {
				model.addAttribute("errorMessage", "에러 발생");
			}
		} else {
			model.addAttribute("errorMessage", errors.getErrorMessage());
		}
		return PathConstants.ERROR_PATH + PathConstants.ERROR_PAGE;
	}
	
	@Override
	public String getErrorPath() {
		return null;
	}
}
