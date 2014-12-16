package com.jcos.teaching.core.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jcos.teaching.core.model.Book;
import com.jcos.teaching.core.service.BookService;

@Controller
public class BookController {
	@Inject
	private BookService bookService;

	@RequestMapping(value = "/books", method = RequestMethod.POST)
	@ResponseBody
	public List<Book> getbooks(HttpServletRequest request, Model model) {
		List<Book> books = bookService.getAllBooks();
		return books;
	}
	
	
	
	
}
