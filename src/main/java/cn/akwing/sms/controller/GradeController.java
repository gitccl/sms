package cn.akwing.sms.controller;

import cn.akwing.sms.pojo.Course;
import cn.akwing.sms.pojo.Grade;
import cn.akwing.sms.service.GradeService;
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
@RequestMapping("/grade")
public class GradeController {
    @Autowired
    private GradeService gradeService;

    @RequestMapping("/goGradeManage")
    public String goGradeManage(){
        return "course/gradeManage";
    }


    @RequestMapping("/getGradeList")
    @ResponseBody
    public Map<String, Object> getGradeList(Integer page, Integer limit, Grade grade){
        System.out.println("getCourseList ->" + grade);
        /* 开启分页 */
        if(page != null && limit != null) {
            PageHelper.startPage(page, limit);
        }
        List<Grade> gradeList = gradeService.selectByCondition(grade);
        PageInfo pageInfo = new PageInfo(gradeList);
        Map<String, Object> map = new HashMap<String, Object>();

        /* 将数据返回给前端 */
        map.put("code", "0");
        map.put("msg", "0");
        map.put("count", pageInfo.getTotal());
        map.put("data", gradeList);

        return map;
    }


    @RequestMapping("/addGrade")
    @ResponseBody
    public Map<String, Object> insertGrade(Grade grade){
        System.out.println("insertGrade ->" + grade);
        Map<String, Object> map = new HashMap<String, Object>();
        int result = gradeService.insert(grade);
        if(result > 0) {
            map.put("success", true);
            map.put("msg","添加成功");
        }else{
            map.put("success", false);
            map.put("msg","添加失败");
        }
        return map;
    }

    @RequestMapping("/deleteGrade")
    @ResponseBody
    public Map<String, Object> deleteGrade(String studentId, String courseId){
        Map<String, Object> map = new HashMap<String, Object>();
        int result = gradeService.delete(studentId, courseId);
        if(result > 0) {
            map.put("success", true);
            map.put("msg","删除成功");
        }else{
            map.put("success", false);
            map.put("msg","删除失败");
        }
        return map;

    }

    @RequestMapping("/updateGrade")
    @ResponseBody
    public Map<String, Object> updateGrade(Grade grade){
        System.out.println("updateGrade -> " + grade);
        Map<String, Object> map = new HashMap<String, Object>();
        int result = gradeService.update(grade);
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
