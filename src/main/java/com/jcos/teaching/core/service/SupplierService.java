package com.jcos.teaching.core.service;

import java.util.List;

import com.jcos.teaching.core.model.Supplier;

public interface SupplierService {

	List<Supplier> getAllSupplier();

	boolean authSupplierById(Integer id);
}
