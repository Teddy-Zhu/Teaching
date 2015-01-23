package com.jcos.teaching.core.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jcos.teaching.core.Exmodel.LoginSession;
import com.jcos.teaching.core.model.Book;
import com.jcos.teaching.core.service.BookService;
import com.jcos.teaching.core.service.BookTypeService;
import com.jcos.teaching.core.service.PowerService;
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

	@Inject
	private PowerService powerService;

	/**
	 * 
	 * @param request
	 * @return
	 */
	public boolean authUserTypePower(HttpServletRequest request, String name) {
		LoginSession loginSession = (LoginSession) request.getSession().getAttribute("loginSession");
		return powerService.queryBookPowerByName(name, loginSession.getLoginUser().getInttypeid());
	}

	/**
	 * 
	 * @param rows
	 * @param page
	 * @param text
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/GetBooks", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getbooks(Integer rows, Integer page, String text, HttpServletRequest request, Model model, HttpServletResponse response) {
		Map<String, Object> ret = new HashMap<String, Object>();
		if (!authUserTypePower(request, "querybook")) {
			response.setStatus(3388);
			return ret;
		}
		ret.put("total", bookService.getBookTotal());
		List<Book> books = bookService.getAllBooks(page, rows);
		ret.put("rows", books);
		return ret;
	}

	/**
	 * 
	 * @param request
	 * @param model
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/AddBook", method = RequestMethod.POST)
	@ResponseBody
	public boolean addbooks(HttpServletRequest request, Model model, HttpServletResponse response) {
		if (!authUserTypePower(request, "addbook")) {
			response.setStatus(3388);
			return true;
		}
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
		return bookService.addnewbook(record);

	}

	/**
	 * 
	 * @param bookId
	 * @param request
	 * @param model
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/RemoveBook", method = RequestMethod.POST)
	@ResponseBody
	public boolean removebook(@RequestParam(value = "bookId[]") Integer[] bookId, HttpServletRequest request, Model model, HttpServletResponse response) {
		if (!authUserTypePower(request, "rmbook")) {
			response.setStatus(3388);
			return false;
		}
		if (bookId != null && bookId.length != 0) {
			return bookService.deletebookbyId(bookId);
		} else
			return false;
	}

	@RequestMapping(value = "/EditBook", method = RequestMethod.POST)
	@ResponseBody
	public boolean updatebook(@RequestParam(value = "bookId[]") Integer[] bookId, HttpServletRequest request, Model model, HttpServletResponse response) {
		if (!authUserTypePower(request, "editbook")) {
			response.setStatus(3388);
			return true;
		}
		String code = "", name = "", sn = "", press = "", author = "";
		int booktype = 0, suppliertype = 0;
		Double price = 0.0, discount = 0.0;
		List<Book> record = new ArrayList<Book>();
		if (bookId != null && bookId.length != 0) {
			for (int i : bookId) {
				try {
					code = request.getParameter("editCode" + i).trim().toString();
					name = request.getParameter("editName" + i).trim().toString();
					sn = request.getParameter("editSN" + i).trim().toString();
					booktype = Integer.valueOf(request.getParameter("BookType" + i).toString());
					suppliertype = Integer.valueOf(request.getParameter("Supplier" + i).toString());
					press = request.getParameter("editPress" + i).trim().toString();
					author = request.getParameter("editAuthor" + i).trim().toString();
					price = Double.valueOf(request.getParameter("editPrice" + i).toString());
					discount = Double.valueOf(request.getParameter("editDisCount" + i).toString());
					// auth type
					if (!bookTypeService.authBookTypeById(booktype)) {
						return false;
					}
					if (!supplierService.authSupplierById(suppliertype)) {
						return false;
					}

					Book book = new Book(i, name, code, sn, booktype, price, press, author, discount, suppliertype, new Date());
					record.add(book);
				} catch (Exception ex) {
					return false;
				}
			}
		}

		return bookService.updatebookByIds(record);
	}

}
