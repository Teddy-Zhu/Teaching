package com.jcos.teaching.core.service;

import java.util.List;

import com.jcos.teaching.core.model.Supplier;

public interface SupplierService {

	List<Supplier> getAllSupplier();

	boolean authSupplierById(Integer id);

	List<Supplier> getAllSuppliersForadmin();

	boolean addSupplier(Supplier record);

	boolean updateSupplierByIds(List<Supplier> record);

	boolean deleteSupplierByIds(Integer[] supplierId);
}
