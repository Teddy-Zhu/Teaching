package com.jcos.teaching.core.util;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class ExcelTool {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(ExcelTool.class);

	private String TemplateOne = "";

	private HSSFWorkbook workBook;

	private HSSFSheet workSheet;

	public ExcelTool(String templateFullPath) throws IOException {
		TemplateOne = templateFullPath;
		workBook = new HSSFWorkbook(new FileInputStream(new File(TemplateOne)));
		logger.debug("initial excel tool");
	}

	public void cloneSheet(int index) {
		workSheet = workBook.cloneSheet(index);
	}

	public void setSheetName(String name) {
		int index = workBook.getSheetIndex(workSheet);
		workBook.setSheetName(index, name);
	}

	public void setCellText(int row, int column, String value) {
		HSSFRow Row = workSheet.getRow(row);
		if (Row == null) {
			Row = workSheet.createRow(row);
		}
		HSSFCell cell = Row.getCell(column);
		if (cell == null) {
			cell = Row.createCell(column);
		}
		cell.setCellValue(value);
	}
	
	public void setCellDouble(int row, int column, Double value) {
		HSSFRow Row = workSheet.getRow(row);
		if (Row == null) {
			Row = workSheet.createRow(row);
		}
		HSSFCell cell = Row.getCell(column);
		if (cell == null) {
			cell = Row.createCell(column);
		}
		cell.setCellValue(value);
	}

	public void setCellFormula(int row, int column, String value) {
		HSSFRow Row = workSheet.getRow(row);
		if (Row == null) {
			Row = workSheet.createRow(row);
		}
		HSSFCell cell = Row.getCell(column);
		if (cell == null) {
			cell = Row.createCell(column);
		}
		cell.setCellFormula(value);
	}

	public void deleteSheet(int index) {
		workBook.removeSheetAt(index);
	}

	public void setCellBorderStyle(int row, int column, String value, short border) {
		HSSFRow Row = workSheet.getRow(row);
		if (Row == null) {
			Row = workSheet.createRow(row);
		}
		HSSFCell cell = Row.getCell(column);
		if (cell == null) {
			cell = Row.createCell(column);
		}
		HSSFCellStyle style = cell.getCellStyle();
		style.setBorderBottom(border);
		style.setBorderLeft(border);
		style.setBorderRight(border);
		style.setBorderTop(border);
		cell.setCellStyle(style);
		cell.setCellValue(value);
	}

	public void setCellAlign(int row, int column, short Align) {
		HSSFRow Row = workSheet.getRow(row);
		if (Row == null) {
			Row = workSheet.createRow(row);
		}
		HSSFCell cell = Row.getCell(column);
		if (cell == null) {
			cell = Row.createCell(column);
		}
		HSSFCellStyle style = cell.getCellStyle();
		style.setAlignment(Align);
		cell.setCellStyle(style);
	}

	public void setAllColumnAutoWidth() {
		for (int i = 0, len = workSheet.getRow(0).getPhysicalNumberOfCells(); i < len; i++) {
			workSheet.autoSizeColumn(i);
		}
	}

	public String getCellString(int row, int column) {
		HSSFRow Row = workSheet.getRow(row);
		if (Row == null) {
			return "";
		}
		HSSFCell Cell = Row.getCell(column);
		if (Cell == null) {
			return "";
		}
		return Cell.getStringCellValue();
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
		ByteArrayOutputStream output = new ByteArrayOutputStream();
		try {
			workBook.write(output);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		logger.debug("get excel stream");
		return output;
	}
}
