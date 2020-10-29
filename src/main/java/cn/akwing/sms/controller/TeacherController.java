package cn.akwing.sms.controller;

import cn.akwing.sms.pojo.Teacher;
import cn.akwing.sms.service.TeacherService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
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

    @RequestMapping("/goTeacherManage")
    public String goTeacherManage(){
        return "teacher/teacherManage";
    }

    @RequestMapping("/getTeacherList")
    @ResponseBody
    public Map<String, Object> getTeacherList(Integer page, Integer limit, Teacher teacher, HttpSession session){

        /* 开启分页 */
        if(page != null && limit != null) {
            PageHelper.startPage(page, limit);
        }

        List<Teacher> teacherList = null;
        int userType = (int) session.getAttribute("userType");

        if(userType == 2){
            teacherList = new ArrayList<Teacher>();
            teacherList.add((Teacher)(session.getAttribute("userInfo")));
        }else {
            teacherList = teacherService.selectByCondition(teacher);
        }
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
    public Map<String, Object> getAllTeacher(HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        int userType = (int) session.getAttribute("userType");
        List<Teacher> teacherList = null;
        /* 如果是老师就返回自己 */
        if(userType == 2){
            teacherList = new ArrayList<Teacher>();
            teacherList.add((Teacher)(session.getAttribute("userInfo")));
        }else{
            teacherList = teacherService.selectAll();
        }

        /* 将数据返回给前端 */
        map.put("code", "0");
        map.put("msg", "0");
        map.put("count", teacherList.size());
        map.put("data", teacherList);

        return map;
    }

    @RequestMapping("/deleteTeacher")
    @ResponseBody
    public Map<String, Object> deleteTeacher(String id){
        Map<String, Object> map = new HashMap<String, Object>();
        int result = teacherService.deleteByPrimaryKey(id);
        if(result > 0) {
            map.put("success", true);
            map.put("msg","删除成功");
        }else{
            map.put("success", false);
            map.put("msg","删除失败");
        }
        return map;
    }

    @RequestMapping("/addTeacher")
    @ResponseBody
    public Map<String, Object> addTeacher(Teacher teacher){
        Map<String, Object> map = new HashMap<String, Object>();
        int result = teacherService.insert(teacher);
        if(result > 0) {
            map.put("success", true);
            map.put("msg","添加成功");
        }else{
            map.put("success", false);
            map.put("msg","添加失败");
        }
        return map;
    }

    @RequestMapping("/updateTeacher")
    @ResponseBody
    public Map<String, Object> updateTeacher(Teacher teacher){
        Map<String, Object> map = new HashMap<String, Object>();
        int result = teacherService.updateByPrimaryKey(teacher);
        if(result > 0) {
            map.put("success", true);
            map.put("msg","修改成功");
        }else{
            map.put("success", false);
            map.put("msg","修改失败");
        }
        return map;
    }

}
