package com.jcos.teaching.core.service;

import java.util.List;

import com.jcos.teaching.core.model.PersonalConfig;

public interface PersonalConfigService {

	boolean addOrUpdatePersonalConfig(List<PersonalConfig> record);

	Integer getPersonalConfig(PersonalConfig record);

}
