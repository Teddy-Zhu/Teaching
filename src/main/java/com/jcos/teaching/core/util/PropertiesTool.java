package com.jcos.teaching.core.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.apache.log4j.Logger;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.support.PropertiesLoaderUtils;

public class PropertiesTool {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(PropertiesTool.class);

	private Properties props;

	public PropertiesTool() {
	}

	public PropertiesTool(String name) {
		ClassPathResource resource = new ClassPathResource("/" + name + ".properties");
		try {
			props = PropertiesLoaderUtils.loadProperties(resource);
		} catch (IOException e) {
			logger.debug(e.getMessage());
		}
	}

	public List<String> getPowerList(String powerName) {
		List<String> list = new ArrayList<String>();
		String powerString = props.getProperty(powerName);
		if (powerString != null && !powerString.trim().equals("")) {
			if (powerString.contains(",")) {
				String[] powers = powerString.split(",");
				int len = powers.length;
				for (int i = 0; i < len; i++) {
					list.add(powers[i].trim());
				}
			} else {
				list.add(powerString.trim());
			}
		}
		return list;
	}
}
