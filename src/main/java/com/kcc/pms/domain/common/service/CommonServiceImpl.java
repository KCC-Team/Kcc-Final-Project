package com.kcc.pms.domain.common.service;

import com.kcc.pms.domain.common.mapper.CommonMapper;
import com.kcc.pms.domain.common.model.dto.CommonCodeSelectList;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CommonServiceImpl implements CommonService {

    private final CommonMapper mapper;

    @Override
    public List<CommonCodeSelectList> getCommonCodeSelectList(String commonCodeNo) {
         return mapper.getCommonCodeList(commonCodeNo);
    }
}
