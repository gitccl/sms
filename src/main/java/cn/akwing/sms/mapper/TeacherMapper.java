package cn.akwing.sms.mapper;

import cn.akwing.sms.pojo.Teacher;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TeacherMapper {
    int deleteByPrimaryKey(String id);

    int insert(Teacher record);

    List<Teacher> selectAll();

    int updateByPrimaryKey(Teacher record);

    List<Teacher> selectByCondition(Teacher teacher);

    Teacher login(@Param("id") String id, @Param("password") String password);
}