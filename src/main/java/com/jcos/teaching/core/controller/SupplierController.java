package com.jcos.teaching.core.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jcos.teaching.core.model.Supplier;
import com.jcos.teaching.core.service.BookService;
import com.jcos.teaching.core.service.SupplierService;
import com.jcos.teaching.core.util.annotation.AuthPower;

@Controller
@RequestMapping(value = "/Supplier")
public class SupplierController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(SupplierController.class);

	@Inject
	private SupplierService supplierService;

	@Inject
	private BookService bookService;


	/**
	 * 
	 * @param id
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/GetAllSuppliers", method = RequestMethod.POST)
	@ResponseBody
	@AuthPower(value = "querysupplier")
	public List<Supplier> getAllSuppliers(HttpServletRequest request, Model model, HttpServletResponse response) {
		return supplierService.getAllSuppliersForadmin();
	}

	/**
	 * @param request
	 * @param model
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/AddNewSupplier", method = RequestMethod.POST)
	@ResponseBody
	@AuthPower(value = "addsupplier")
	public boolean addNewSupplier(HttpServletRequest request, Model model, HttpServletResponse response) {
		String code = "", name = "", address = "", companyphone = "", handleperson = "", handlephone = "", contactperson = "", contactphone = "";
		try {

			code = request.getParameter("newCode");
			name = request.getParameter("newName");
			address = request.getParameter("newAddress");
			companyphone = request.getParameter("newCompanyPhone");
			handleperson = request.getParameter("newHandlePerson");
			handlephone = request.getParameter("newHandlePhone");
			contactperson = request.getParameter("newContactPerson");
			contactphone = request.getParameter("newContactPhone");
		} catch (Exception e) {
			logger.debug(e.getMessage());
			response.setStatus(3386); // get parameter error
			return false;
		}

		Supplier record = new Supplier();
		record.setIntsupplierid(null); // for new
		record.setIntcoding(code);
		record.setStrname(name);
		record.setStrcompanyphone(companyphone);
		record.setStrhandlepersonname(handleperson);
		record.setStrhandlephone(handlephone);
		record.setStraddress(address);
		record.setStrcontactpersonname(contactperson);
		record.setStrcontactpersonphone(contactphone);

		return supplierService.addSupplier(record);
	}

	@RequestMapping(value = "/UpdateSuppliers", method = RequestMethod.POST)
	@ResponseBody
	@AuthPower(value = "editsupplier")
	public boolean editSuppliers(@RequestParam(value = "supplierId[]") Integer[] supplierId, HttpServletRequest request, Model model, HttpServletResponse response) {
		String code = "", name = "", address = "", companyphone = "", handleperson = "", handlephone = "", contactperson = "", contactphone = "";
		List<Supplier> record = new ArrayList<Supplier>();
		try {
			for (Integer i : supplierId) {
				code = request.getParameter("editCode" + i);
				name = request.getParameter("editName" + i);
				address = request.getParameter("editAddress" + i);
				companyphone = request.getParameter("editCompanyPhone" + i);
				handleperson = request.getParameter("editHandlePerson" + i);
				handlephone = request.getParameter("editHandlePhone" + i);
				contactperson = request.getParameter("editContactPerson" + i);
				contactphone = request.getParameter("editContactPhone" + i);
				Supplier supplier = new Supplier();
				supplier.setIntsupplierid(i);
				supplier.setIntcoding(code);
				supplier.setStrname(name);
				supplier.setStrcompanyphone(companyphone);
				supplier.setStrhandlepersonname(handleperson);
				supplier.setStrhandlephone(handlephone);
				supplier.setStraddress(address);
				supplier.setStrcontactpersonname(contactperson);
				supplier.setStrcontactpersonphone(contactphone);
				record.add(supplier);
			}

		} catch (Exception e) {
			logger.debug(e.getMessage());
			response.setStatus(3386); // get parameter error
			return false;
		}

		return supplierService.updateSupplierByIds(record);
	}

	@RequestMapping(value = "/RemoveSupplier", method = RequestMethod.POST)
	@ResponseBody
	@AuthPower(value = "rmsupplier")
	public Object removebook(@RequestParam(value = "supplierId[]") Integer[] supplierId, HttpServletRequest request, Model model, HttpServletResponse response) {
		if (supplierId != null && supplierId.length != 0) {
			Integer ret = bookService.authExistSupplierInUse(supplierId);
			if (ret != 0) {
				return ret;
			}
			return supplierService.deleteSupplierByIds(supplierId);
		} else {
			response.setStatus(3386);
			return false;
		}
	}
}
