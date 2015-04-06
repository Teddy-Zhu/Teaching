package com.jcos.teaching.core.service;

import java.util.List;

import com.jcos.teaching.core.model.Config;

public interface ConfigService {

	public Config queryByName(String name);

	public String getAllVersion();

	boolean updateConfigList(List<Config> list);

	List<Config> queryByNames(String[] array);

	List<String> queryListByName(String name);

}
