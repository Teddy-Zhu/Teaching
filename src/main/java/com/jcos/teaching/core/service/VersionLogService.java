package com.jcos.teaching.core.service;

import java.util.List;

import com.jcos.teaching.core.model.VersionLog;

public interface VersionLogService {

	VersionLog queryCururentVersion();

	List<VersionLog> getVersions(Integer page, Integer rows);

	int getTotal();
}
