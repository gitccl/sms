package cn.akwing.sms.service;

import cn.akwing.sms.pojo.Admin;

/**
 * @author c1515
 */
public interface AdminService {

    Admin login(String id, String password);

    int updateByPrimaryKey(Admin record);
}
