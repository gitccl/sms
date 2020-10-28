package cn.akwing.sms.controller;

import cn.akwing.sms.pojo.Admin;
import cn.akwing.sms.pojo.Course;
import cn.akwing.sms.pojo.Teacher;
import cn.akwing.sms.service.AdminService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.wf.captcha.utils.CaptchaUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
    private String goLogin() {
        return "system/login";
    }

    @RequestMapping("/getCaptcha")
    public void getCaptcha(HttpServletRequest request, HttpServletResponse response) throws Exception {
        CaptchaUtil.out(request, response);
    }

    @RequestMapping("/login")
    @ResponseBody
    public Map<String, Object> login(String id, String password, String verCode, HttpSession session, HttpServletRequest request){
        System.out.println(id + " " + password);
        Map<String, Object> map = new HashMap<String, Object>();
        if (!CaptchaUtil.ver(verCode, request)) {
            CaptchaUtil.clear(request);
            map.put("success", false);
            map.put("msg", "验证码错误");
            return map;
        }

        Admin admin = adminService.login(id, password);
        if(admin != null) {
            session.setAttribute("userInfo", admin);
            session.setAttribute("userType", 1);
            map.put("success", true);
            map.put("msg", "登录成功");
        } else{
            map.put("success", false);
            map.put("msg", "用户名或密码错误");
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
