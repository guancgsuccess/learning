package com.rush.ui;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pages")
public class PagesTest {
    @RequestMapping("/test1")
    public String pagesTest() {
        return "login";
    }
}
