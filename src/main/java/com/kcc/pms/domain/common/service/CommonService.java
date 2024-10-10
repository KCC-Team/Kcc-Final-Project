package com.kcc.pms.domain.common.service;

import com.kcc.pms.domain.common.model.dto.CommonCodeSelectListResponseDto;

import java.util.List;

public interface CommonService {
    List<CommonCodeSelectListResponseDto> getCommonCodeSelectList(String commonCodeNo);
}
