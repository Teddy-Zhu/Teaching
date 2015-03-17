package com.jcos.teaching.core.util;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service
public class DownloadTool {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(DownloadTool.class);

	public boolean pushOutputStream(HttpServletResponse response, ByteArrayOutputStream output, String name) {
		OutputStream os;
		try {
			os = response.getOutputStream();
			response.reset();
			response.setHeader("Content-Disposition", "attachment; filename=" + name);
			response.setContentType("application/octet-stream; charset=utf-8");
			os.write(output.toByteArray());
			os.flush();
			output.close();
			os.close();
			return true;
		} catch (IOException e1) {
			logger.debug(e1.getMessage());
			return false;
		}
	}
}
