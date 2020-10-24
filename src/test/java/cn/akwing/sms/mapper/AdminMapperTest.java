package cn.akwing.sms.mapper;

import cn.akwing.sms.pojo.Admin;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author c1515
 */
public class AdminMapperTest {

    @Autowired
    public AdminMapper adminMapper;

    @Test
    public void test(){
        Admin admin = adminMapper.login("admin", "admin");
        System.out.println(admin);
    }

}
