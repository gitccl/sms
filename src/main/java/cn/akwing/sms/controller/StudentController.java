package cn.akwing.sms.controller;

import cn.akwing.sms.pojo.Student;
import cn.akwing.sms.service.StudentService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author c1515
 */
@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private StudentService studentService;

    @RequestMapping("/goStudentManage")
    public String goStudentManage(){
        return "student/studentManage";
    }


    @RequestMapping("/getStudentList")
    @ResponseBody
    public Map<String, Object> getStudentList(int page, int limit, Student student){

        /* 开启分页 */
        PageHelper.startPage(page, limit);
        List<Student> studentList = studentService.selectByCondition(student);
        PageInfo pageInfo = new PageInfo(studentList);
        Map<String, Object> map = new HashMap<String, Object>();

        /* 将数据返回给前端 */
        map.put("code", "0");
        map.put("msg", "0");
        map.put("count", pageInfo.getTotal());
        map.put("data", studentList);

        try {
            System.out.println(new ObjectMapper().writeValueAsString(map));
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        return map;
    }


    @RequestMapping("/deleteStudent")
    @ResponseBody
    public Map<String, Object> deleteStudent(String[] id){
        System.out.println("deleteStudent -> " + Arrays.toString(id));
        Map<String, Object> map = new HashMap<String, Object>();
        int result = studentService.deleteByPrimaryKey(id);
        if(result > 0) {
            map.put("success", true);
            map.put("msg","删除成功");
        }else{
            map.put("success", false);
            map.put("msg","删除失败");
        }
        return map;
    }

    @RequestMapping("/addStudent")
    @ResponseBody
    public Map<String, Object> addStudent(Student student){
        Map<String, Object> map = new HashMap<String, Object>();
        int result = studentService.insertStudent(student);
        if(result > 0) {
            map.put("success", true);
            map.put("msg","添加成功");
        }else{
            map.put("success", false);
            map.put("msg","添加失败");
        }
        return map;
    }

    @RequestMapping("/updateStudent")
    @ResponseBody
    public Map<String, Object> updateStudent(Student student){
        Map<String, Object> map = new HashMap<String, Object>();
        int result = studentService.updateStudent(student);
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
