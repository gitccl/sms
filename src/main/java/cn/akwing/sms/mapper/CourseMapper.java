package cn.akwing.sms.mapper;

import cn.akwing.sms.pojo.Course;
import java.util.List;

public interface CourseMapper {
    int deleteByPrimaryKey(String id);

    int insert(Course record);

    Course selectByPrimaryKey(String id);

    List<Course> selectAll();

    int updateByPrimaryKey(Course record);
}