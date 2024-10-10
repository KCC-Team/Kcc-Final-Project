package com.kcc.pms.domain.common.mapper;

import com.kcc.pms.domain.common.model.dto.CommonCodeSelectListResponseDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CommonMapper {
    List<CommonCodeSelectListResponseDto> getCommonCodeList(String commonCodeNo);
}
