package cn.akwing.sms.service.impl;

import cn.akwing.sms.mapper.CourseMapper;
import cn.akwing.sms.pojo.Course;
import cn.akwing.sms.service.CourseService;
import com.mysql.jdbc.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author c1515
 */
@Service
public class CourseServiceImpl implements CourseService {

    @Autowired
    private CourseMapper courseMapper;

    @Override
    public List<Course> selectByCondition(Course course){

        if(StringUtils.isNullOrEmpty(course.getName())) {
            course.setName(null);
        }

        if(StringUtils.isNullOrEmpty(course.getTeacherName())) {
            course.setTeacherName(null);
        }

        return courseMapper.selectByCondition(course);
    }

    @Override
    public int deleteByPrimaryKey(String id) {
        return courseMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insertCourse(Course course) {
        return courseMapper.insert(course);
    }

    @Override
    public int updateCourse(Course course) {
        return courseMapper.updateByPrimaryKey(course);
    }

    @Override
    public List<Course> selectByStudentId(String studentId) {
        return courseMapper.selectByStudentId(studentId);
    }
}
