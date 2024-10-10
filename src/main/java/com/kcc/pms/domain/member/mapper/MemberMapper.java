package com.kcc.pms.domain.member.mapper;

import com.kcc.pms.domain.member.model.dto.GroupMembersResponseDto;
import com.kcc.pms.domain.member.model.dto.GroupResponseDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MemberMapper {
    List<GroupResponseDto> getGroupList();
    List<GroupMembersResponseDto> getGroupMemberList(Long groupNo);
}
