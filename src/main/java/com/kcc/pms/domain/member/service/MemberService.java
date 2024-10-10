package com.kcc.pms.domain.member.service;

import com.kcc.pms.domain.member.model.dto.GroupResponseDto;

import java.util.List;

public interface MemberService {
    List<GroupResponseDto> getGroupList();
}
