package com.jcos.teaching.core.util;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class ExcelTool {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(ExcelTool.class);

	private static String TemplateOne = "";

	private HSSFWorkbook workBook;

	private HSSFSheet workSheet;

	public ExcelTool(HttpServletRequest request) throws IOException {
		this.TemplateOne = request.getSession().getServletContext().getRealPath("/") + "/WEB-INF/resources/excel/teacher.xls";
		workBook = new HSSFWorkbook(new FileInputStream(new File(this.TemplateOne)));
	}

	public void setCellText(int row, int column, String value) {
		HSSFCell cell = workSheet.getRow(row).getCell(column);
		cell.setCellValue(value);
	}

	public void setCellBorderStyle(int row, int column, String value, short border) {
		HSSFCell cell = workSheet.getRow(row).getCell(column);
		HSSFCellStyle style = cell.getCellStyle();
		style.setBorderBottom(border);
		style.setBorderLeft(border);
		style.setBorderRight(border);
		style.setBorderTop(border);
		cell.setCellStyle(style);
		cell.setCellValue(value);
	}

	public void setAllColumnAutoWidth() {
		for (int i = 0, len = workSheet.getRow(0).getPhysicalNumberOfCells(); i < len; i++) {
			workSheet.autoSizeColumn(i);
		}
	}

	public void setColumnAutoWidth(int column) {
		workSheet.autoSizeColumn(column);
	}

	public boolean setworkSheet(int index) {
		workSheet = workBook.getSheetAt(index);
		if (workSheet != null) {
			return true;
		} else {
			return false;
		}
	}

	public ByteArrayOutputStream getXlsStream() {
		ByteArrayOutputStream output = new ByteArrayOutputStream() ;
		try {
			workBook.write(output);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return output;
	}

	public HSSFWorkbook getWorkBook() {
		return workBook;
	}

	public void setWorkBook(HSSFWorkbook workBook) {
		this.workBook = workBook;
	}

	public HSSFSheet getWorkSheet() {
		return workSheet;
	}

	public void setWorkSheet(HSSFSheet workSheet) {
		this.workSheet = workSheet;
	}

}
