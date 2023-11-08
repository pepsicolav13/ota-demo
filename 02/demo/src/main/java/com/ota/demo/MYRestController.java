package com.ota.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MYRestController {

    @GetMapping("/")
    public String get() {
        return "Hello world!1";
    }
}
