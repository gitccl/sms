package cn.akwing.sms.controller;

import cn.akwing.sms.pojo.Admin;
import cn.akwing.sms.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * @author c1515
 */
@Controller
@RequestMapping("/system")
public class SystemController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("/goLogin")
    private String goLogin(){
        return "system/login";
    }

    @RequestMapping("/login")
    @ResponseBody
    public Map<String, Object> login(String username, String password){
        System.out.println(username + " " + password);
        Map<String, Object> map = new HashMap<String, Object>();
        Admin admin = adminService.login(username, password);
        if(admin != null) {
            map.put("userInfo", admin);
            map.put("success", true);
        } else{
            map.put("success", false);
        }
        return map;
    }


    @RequestMapping("/goMain")
    private String goMain(){
        return "system/main";
    }

}
