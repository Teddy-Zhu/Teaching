package com.jcos.teaching.core.service.Impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jcos.teaching.core.dao.SupplierMapper;
import com.jcos.teaching.core.model.Supplier;
import com.jcos.teaching.core.service.SupplierService;

@Service
public class SupplierImpl implements SupplierService {

	@Inject
	private SupplierMapper supplierDao;

	@Override
	public List<Supplier> getAllSupplier() {

		return supplierDao.querySupplierType();
	}

	@Override
	public boolean authSupplierById(Integer id) {
		Supplier type = supplierDao.selectByPrimaryKey(id);
		if (type != null && type.getIntsupplierid() == id) {
			return true;
		}
		return false;
	}
}
