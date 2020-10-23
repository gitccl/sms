package cn.akwing.sms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author c1515
 */
@Controller
@RequestMapping("/system")
public class SystemController {
    @RequestMapping("/goLogin")
    private String goLogin(){
        return "system/login";
    }

}
