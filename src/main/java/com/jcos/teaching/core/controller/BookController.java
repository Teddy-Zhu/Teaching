package com.jcos.teaching.core.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jcos.teaching.core.model.Book;
import com.jcos.teaching.core.service.BookService;
import com.jcos.teaching.core.service.BookTypeService;
import com.jcos.teaching.core.service.SupplierService;

@Controller
@RequestMapping(value = "/Book")
public class BookController {
	@Inject
	private BookService bookService;

	@Inject
	private BookTypeService bookTypeService;

	@Inject
	private SupplierService supplierService;

	@RequestMapping(value = "/GetBooks", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getbooks(Integer rows, Integer page, String text, HttpServletRequest request, Model model) {
		Map<String, Object> ret = new HashMap<String, Object>();
		ret.put("total", bookService.getBookTotal());
		List<Book> books = bookService.getAllBooks(page, rows);
		ret.put("rows", books);
		return ret;
	}

	@RequestMapping(value = "/AddBook", method = RequestMethod.POST)
	@ResponseBody
	public boolean addbooks(HttpServletRequest request, Model model) {
		String code = "", name = "", sn = "", press = "", author = "";
		int booktype = 0, suppliertype = 0;
		Double price = 0.0, discount = 0.0;
		try {
			code = request.getParameter("newCode").trim().toString();
			name = request.getParameter("newName").trim().toString();
			sn = request.getParameter("newSN").trim().toString();
			booktype = Integer.valueOf(request.getParameter("BookType").toString());
			suppliertype = Integer.valueOf(request.getParameter("Supplier").toString());
			press = request.getParameter("newPress").trim().toString();
			author = request.getParameter("newAuthor").trim().toString();
			price = Double.valueOf(request.getParameter("newPrice").toString());
			discount = Double.valueOf(request.getParameter("newDisCount").toString());
		} catch (Exception ex) {
			return false;
		}
		// auth type
		if (!bookTypeService.authBookTypeById(booktype)) {
			return false;
		}
		if (!supplierService.authSupplierById(suppliertype)) {
			return false;
		}
		Book record = new Book(name, code, sn, booktype, price, press, author, discount, suppliertype, new Date());
		if (bookService.addnewbook(record) != 0)
			return true;
		return false;
	}
}
