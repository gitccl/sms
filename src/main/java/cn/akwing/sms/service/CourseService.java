package cn.akwing.sms.service;

import cn.akwing.sms.pojo.Course;

import java.util.List;

/**
 * @author c1515
 */
public interface CourseService {

    List<Course> selectByCondition(Course course);

    int deleteByPrimaryKey(String id);

    int insertCourse(Course course);

    int updateCourse(Course course);
}
