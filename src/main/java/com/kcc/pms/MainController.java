package com.kcc.pms;

import lombok.NoArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@NoArgsConstructor
public class MainController {

    // 로그인
    @GetMapping("/login")
    public String login() {
        return "login";
    }

}
