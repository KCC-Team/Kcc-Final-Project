package com.kcc.pms.domain.member.service;

import com.kcc.pms.domain.member.model.dto.GroupMembersResponseDto;
import com.kcc.pms.domain.member.model.dto.GroupResponseDto;

import java.util.List;

public interface MemberService {
    List<GroupResponseDto> getGroupList();
    List<GroupMembersResponseDto> getGroupMembers(Long groupNo);
}
