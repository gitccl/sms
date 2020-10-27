package cn.akwing.sms.mapper;

import cn.akwing.sms.pojo.Course;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CourseMapper {
    int deleteByPrimaryKey(@Param("id") String id);

    int insert(Course record);

    Course selectByPrimaryKey(String id);

    List<Course> selectAll();

    int updateByPrimaryKey(Course record);

    List<Course> selectByCondition(Course course);

    List<Course> selectByStudentId(@Param("studentId") String studentId);
}