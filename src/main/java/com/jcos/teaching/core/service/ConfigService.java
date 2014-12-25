package com.jcos.teaching.core.service;

import com.jcos.teaching.core.model.Config;

public interface ConfigService {

	public Config queryByName(String name);

	public String getAllVersion();

}
