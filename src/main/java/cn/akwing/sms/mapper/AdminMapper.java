package cn.akwing.sms.mapper;

import cn.akwing.sms.pojo.Admin;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminMapper {
    int deleteByPrimaryKey(String id);

    int insert(Admin record);

    Admin selectByPrimaryKey(String id);

    List<Admin> selectAll();

    int updateByPrimaryKey(Admin record);

    Admin login(@Param("id") String id, @Param("password") String password);

}