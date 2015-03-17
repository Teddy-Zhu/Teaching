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

	@Override
	public List<Supplier> getAllSuppliersForadmin() {
		return supplierDao.queryAllSupplier();
	}

	@Override
	public boolean addSupplier(Supplier record) {
		Integer i = supplierDao.insertSelective(record);
		if (i == 1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean updateSupplierByIds(List<Supplier> record) {
		for (Supplier supplier : record) {
			if (supplierDao.updateByPrimaryKeySelective(supplier) != 1) {
				return false;
			}
		}
		return true;
	}

	@Override
	public boolean deleteSupplierByIds(Integer[] supplierId) {
		for (Integer i : supplierId) {
			if (supplierDao.deleteByPrimaryKey(i) != 1) {
				return false;
			}
		}
		return true;
	}
}
