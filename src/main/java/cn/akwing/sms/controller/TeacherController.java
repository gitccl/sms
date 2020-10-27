package cn.akwing.sms.controller;

import cn.akwing.sms.pojo.Student;
import cn.akwing.sms.pojo.Teacher;
import cn.akwing.sms.service.TeacherService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author c1515
 */
@Controller
@RequestMapping("/teacher")
public class TeacherController {

    @Autowired
    private TeacherService teacherService;

    @RequestMapping("/getTeacherList")
    @ResponseBody
    public Map<String, Object> getTeacherList(int page, int limit, Teacher teacher){

        /* 开启分页 */
        PageHelper.startPage(page, limit);
        List<Teacher> teacherList = teacherService.selectByCondition(teacher);
        PageInfo pageInfo = new PageInfo(teacherList);
        Map<String, Object> map = new HashMap<String, Object>();

        /* 将数据返回给前端 */
        map.put("code", "0");
        map.put("msg", "0");
        map.put("count", pageInfo.getTotal());
        map.put("data", teacherList);

        return map;
    }

    @RequestMapping("/getAllTeacher")
    @ResponseBody
    public Map<String, Object> getAllTeacher() {
        List<Teacher> teacherList = teacherService.selectAll();
        Map<String, Object> map = new HashMap<String, Object>();

        /* 将数据返回给前端 */
        map.put("code", "0");
        map.put("msg", "0");
        map.put("count", teacherList.size());
        map.put("data", teacherList);

        return map;
    }

}
