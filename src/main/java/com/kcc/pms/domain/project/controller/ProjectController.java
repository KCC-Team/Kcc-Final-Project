package com.kcc.pms.domain.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/projects")
public class ProjectController {

    // 프로젝트 현황
    @GetMapping("/list")
    public String list() {
        return "project/list";
    }

    // 프로젝트 등록
    @GetMapping("/register")
    public String register() {
        return "project/register";
    }

    // 프로젝트 수정
    @GetMapping("/modify")
    public String modify() {
        return "project/modify";
    }

    // 프로젝트 정보
    @GetMapping("/info")
    public String info() {
        return "project/info";
    }

    // 대시보드
    @GetMapping("/dashboard")
    public String dashboard() {
        return "project/dashboard";
    }

}
