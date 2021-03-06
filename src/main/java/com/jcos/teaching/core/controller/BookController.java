package com.jcos.teaching.core.controller;

import com.jcos.teaching.core.model.Book;
import com.jcos.teaching.core.service.BookPlanService;
import com.jcos.teaching.core.service.BookService;
import com.jcos.teaching.core.service.BookTypeService;
import com.jcos.teaching.core.service.SupplierService;
import com.jcos.teaching.core.util.annotation.AuthPower;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.*;

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
	private BookPlanService bookPlanService;

	/**
	 *
	 * @param request
	 * @param model
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/GetBooks", method = RequestMethod.POST)
	@ResponseBody
	@AuthPower(value = "querybook")
	public Map<String, Object> getbooks(HttpServletRequest request, Model model, HttpServletResponse response) {
		Map<String, Object> ret = new HashMap<String, Object>();
		Integer rows = 10, page = 1;
		String code = "", name = "", sn = "", press = "", author = "";
		Double price = 0.0, discount = 0.0;
		Integer type = -1, supplier = -1;
		Date date = null;
		try {
			rows = Integer.valueOf(request.getParameter("rows"));
			page = Integer.valueOf(request.getParameter("page"));
			code = request.getParameter("SearchCode").trim().equals("") ? null : request.getParameter("SearchCode").trim();
			name = request.getParameter("SearchName").trim().equals("") ? null : request.getParameter("SearchName").trim();
			sn = request.getParameter("SearchSN").trim().equals("") ? null : request.getParameter("SearchSN").trim();
			type = Integer.valueOf(request.getParameter("SearchType")) == -1 ? null : Integer.valueOf(request.getParameter("SearchType").trim());
			press = request.getParameter("SearchPress").trim().equals("") ? null : request.getParameter("SearchPress").trim();
			author = request.getParameter("SearchAuthor").trim().equals("") ? null : request.getParameter("SearchAuthor").trim();
			supplier = Integer.valueOf(request.getParameter("SearchSupplier")) == -1 ? null : Integer.valueOf(request.getParameter("SearchSupplier").trim());
			price = request.getParameter("SearchPrice").trim().equals("") ? null : Double.valueOf(request.getParameter("SearchPrice").trim());
			discount = request.getParameter("SearchDiscount").trim().equals("") ? null : Double.valueOf(request.getParameter("SearchDiscount").trim());
			date = request.getParameter("SearchDate").trim().equals("") ? null : new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("SearchDate").trim());
		} catch (Exception e) {
			response.setStatus(3386);
			return null;
		}

		Book record = new Book(null, name, code, sn, type, price, press, author, discount, supplier, date);
		ret.put("total", bookService.getBookTotal(record));
		ret.put("rows", bookService.getAllBooks(record, page, rows));
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
	@AuthPower(value = "addbook")
	public boolean addbooks(HttpServletRequest request, Model model, HttpServletResponse response) {
		String code = "", name = "", sn = "", press = "", author = "";
		int booktype = 0, suppliertype = 0;
		Double price = 0.0, discount = 0.0;
		try {
			code = request.getParameter("newCode").trim().toString();
			name = request.getParameter("newName").trim().toString();
			sn = request.getParameter("newSN").trim().toString();
			booktype = Integer.valueOf(request.getParameter("newBookType").toString());
			suppliertype = Integer.valueOf(request.getParameter("newSupplierType").toString());
			press = request.getParameter("newPress").trim().toString();
			author = request.getParameter("newAuthor").trim().toString();
			price = Double.valueOf(request.getParameter("newPrice").toString());
			discount = Double.valueOf(request.getParameter("newDisCount").toString());
		} catch (Exception ex) {
			response.setStatus(3386);
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
	@AuthPower(value = "rmbook")
	public Object removebook(@RequestParam(value = "bookId[]") Integer[] bookId, HttpServletRequest request, Model model, HttpServletResponse response) {
		if (bookId != null && bookId.length != 0) {
			Integer ret = bookPlanService.authExistBookInUse(bookId);
			if (ret != 0) {
				return ret;
			}
			return bookService.deletebookbyId(bookId);
		} else {
			response.setStatus(3386);
			return false;
		}
	}

	@RequestMapping(value = "/EditBook", method = RequestMethod.POST)
	@ResponseBody
	@AuthPower(value = "editbook")
	public boolean updatebook(@RequestParam(value = "bookId[]") Integer[] bookId, HttpServletRequest request, Model model, HttpServletResponse response) {
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
					booktype = Integer.valueOf(request.getParameter("editBookType" + i).toString());
					suppliertype = Integer.valueOf(request.getParameter("editSupplierType" + i).toString());
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
					response.setStatus(3386);
					return false;
				}
			}
		}

		return bookService.updatebookByIds(record);
	}

}
