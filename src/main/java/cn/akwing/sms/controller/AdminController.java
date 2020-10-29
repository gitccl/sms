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
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("/updateAdmin")
    @ResponseBody
    public Map<String, Object> updataAdmin(Admin admin) {
        Map<String, Object> map = new HashMap<String, Object>();
        int result = adminService.updateByPrimaryKey(admin);
        if(result > 0) {
            map.put("success", true);
            map.put("msg", "修改成功");
        }else{
            map.put("success", false);
            map.put("msg", "修改失败");
        }
        return map;
    }

}
