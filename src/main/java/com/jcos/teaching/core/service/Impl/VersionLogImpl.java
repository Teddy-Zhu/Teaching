package com.jcos.teaching.core.service.Impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jcos.teaching.core.dao.VersionLogMapper;
import com.jcos.teaching.core.model.VersionLog;
import com.jcos.teaching.core.service.VersionLogService;

@Service
public class VersionLogImpl implements VersionLogService {

	@Inject
	private VersionLogMapper versionLogDao;

	@Override
	public VersionLog queryCururentVersion() {
		VersionLog curVersionInfo = versionLogDao.queryVersions(0, 1).get(0);
		return curVersionInfo;
	}

	@Override
	public List<VersionLog> getVersions(Integer page, Integer rows) {
		return versionLogDao.queryVersions(rows * (page - 1), rows);
	}

	@Override
	public int getTotal() {
		return versionLogDao.getTotalVersion();
	}
}
