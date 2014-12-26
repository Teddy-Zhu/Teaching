package com.jcos.teaching.core.service;

import java.util.List;

import com.jcos.teaching.core.model.Book;

public interface BookService {

	public List<Book> getAllBooks(Integer page, Integer rows);

	public int addnewbook(Book record);

	public int getBookTotal();
}
