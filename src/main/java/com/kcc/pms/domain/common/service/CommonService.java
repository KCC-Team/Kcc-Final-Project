package com.kcc.pms.domain.common.service;

import com.kcc.pms.domain.common.model.dto.CommonCodeSelectList;

import java.util.List;

public interface CommonService {
    List<CommonCodeSelectList> getCommonCodeSelectList(String commonCodeNo);
}
