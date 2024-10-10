package com.kcc.pms.domain.member.controller;

import com.kcc.pms.domain.member.model.dto.GroupResponseDto;
import com.kcc.pms.domain.member.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/projects")
public class MemberController {

    private final MemberService memberService;

    @GetMapping("/members")
    public String members() {
        return "member/list";
    }

    @GetMapping("/addMember")
    public String addMember() {
        return "member/memberRegister";
    }

    @GetMapping("getGroupList")
    @ResponseBody
    public List<GroupResponseDto> groupList() {
        return memberService.getGroupList();
    }
}
