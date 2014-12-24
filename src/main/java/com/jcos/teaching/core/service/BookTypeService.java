package com.jcos.teaching.core.service;

import java.util.List;

import com.jcos.teaching.core.model.BookType;

public interface BookTypeService {

	List<BookType> getAllBookType();

	boolean authBookTypeById(Integer id);
}
