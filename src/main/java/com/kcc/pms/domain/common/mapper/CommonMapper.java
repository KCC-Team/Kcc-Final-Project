package com.kcc.pms.domain.common.mapper;

import com.kcc.pms.domain.common.model.dto.CommonCodeSelectList;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CommonMapper {
    List<CommonCodeSelectList> getCommonCodeList(String commonCodeNo);
}
