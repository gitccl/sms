package cn.akwing.sms.controller;

import cn.akwing.sms.pojo.Course;
import cn.akwing.sms.service.CourseService;
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
@RequestMapping("/course")
@Controller
public class CourseController {

    @Autowired
    private CourseService courseService;

    @RequestMapping("/goCourseManage")
    public String goCourseManage(){
        return "course/courseManage";
    }

    @RequestMapping("/getCourseList")
    @ResponseBody
    public Map<String, Object> getCourseList(Integer page, Integer limit, Course course){
        System.out.println("getCourseList ->" + course);
        /* 开启分页 */
        if(page != null && limit != null) {
            PageHelper.startPage(page, limit);
        }
        List<Course> courseList = courseService.selectByCondition(course);
        PageInfo pageInfo = new PageInfo(courseList);
        Map<String, Object> map = new HashMap<String, Object>();

        /* 将数据返回给前端 */
        map.put("code", "0");
        map.put("msg", "0");
        map.put("count", pageInfo.getTotal());
        map.put("data", courseList);

        return map;
    }


    @RequestMapping("/addCourse")
    @ResponseBody
    public Map<String, Object> insertCourse(Course course){
        System.out.println("insertCourse ->" + course);
        Map<String, Object> map = new HashMap<String, Object>();
        int result = courseService.insertCourse(course);
        if(result > 0) {
            map.put("success", true);
            map.put("msg","添加成功");
        }else{
            map.put("success", false);
            map.put("msg","添加失败");
        }
        return map;
    }

    @RequestMapping("/deleteCourse")
    @ResponseBody
    public Map<String, Object> deleteCourse(String id){
        System.out.println("deleteCourse ->" + id);
        Map<String, Object> map = new HashMap<String, Object>();
        int result = courseService.deleteByPrimaryKey(id);
        if(result > 0) {
            map.put("success", true);
            map.put("msg","删除成功");
        }else{
            map.put("success", false);
            map.put("msg","删除失败");
        }
        return map;

    }

    @RequestMapping("/updateCourse")
    @ResponseBody
    public Map<String, Object> updateCourse(Course course){
        System.out.println("updateCourse ->" + course);
        Map<String, Object> map = new HashMap<String, Object>();
        int result = courseService.updateCourse(course);
        if(result > 0) {
            map.put("success", true);
            map.put("msg","修改成功");
        }else{
            map.put("success", false);
            map.put("msg","修改失败");
        }
        return map;

    }


    @RequestMapping("/selectCourseByStudent")
    @ResponseBody
    public Map<String, Object> selectCourseByStudent(String studentId){
        Map<String, Object> map = new HashMap<String, Object>();
        List<Course> courseList = courseService.selectByStudentId(studentId);
        map.put("data", courseList);
        return map;
    }


}
