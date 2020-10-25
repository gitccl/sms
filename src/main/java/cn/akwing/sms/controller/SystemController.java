package cn.akwing.sms.controller;

import cn.akwing.sms.pojo.Admin;
import cn.akwing.sms.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
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
    public Map<String, Object> login(String id, String password, HttpSession session){
        System.out.println(id + " " + password);
        Map<String, Object> map = new HashMap<String, Object>();
        Admin admin = adminService.login(id, password);
        if(admin != null) {
            session.setAttribute("userInfo", admin);
            session.setAttribute("userType", 1);
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

    @RequestMapping("/goWelcome")
    private String goWelcome(){
        return "system/welcome";
    }

    @RequestMapping("/goLogout")
    private String goLogout(HttpSession session){
        session.removeAttribute("userInfo");
        session.removeAttribute("userType");
        return "system/login";
    }

}
