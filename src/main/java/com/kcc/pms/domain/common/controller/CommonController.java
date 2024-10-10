package com.kcc.pms.domain.common.controller;

import com.kcc.pms.domain.common.model.dto.CommonCodeSelectListResponseDto;
import com.kcc.pms.domain.common.service.CommonService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class CommonController {

    private final CommonService commonService;

    @GetMapping("/login")
    public String login() {
        return "login";
    }


    @GetMapping("/getCommonCodeList")
    @ResponseBody
    public List<CommonCodeSelectListResponseDto> getCommonCodeList(@RequestParam("commonCodeNo") String commonCodeNo) {
        System.out.println(commonCodeNo);
        return commonService.getCommonCodeSelectList(commonCodeNo);
    }

}
