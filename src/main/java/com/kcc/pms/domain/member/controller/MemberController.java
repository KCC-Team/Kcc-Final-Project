package com.kcc.pms.domain.member.controller;

import lombok.NoArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@NoArgsConstructor
@RequestMapping("/projects")
public class MemberController {

    @GetMapping("/members")
    public String members() {
        return "member/list";
    }

    @GetMapping("/addMember")
    public String addMember() {
        System.out.println("caaaaaaaaaaa");
        return "member/memberRegister";
    }
}
