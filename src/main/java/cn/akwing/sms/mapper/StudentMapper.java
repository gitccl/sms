package cn.akwing.sms.mapper;

import cn.akwing.sms.pojo.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StudentMapper {
    int deleteByPrimaryKey(@Param("id") String[] id);

    int insert(Student record);

    Student selectByPrimaryKey(String id);

    List<Student> selectAll();

    int updateByPrimaryKey(Student record);

    List<Student> selectByCondition(Student student);

    Student login(@Param("id") String id, @Param("password") String password);
}