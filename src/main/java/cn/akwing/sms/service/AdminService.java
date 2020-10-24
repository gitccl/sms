package cn.akwing.sms.service;

import cn.akwing.sms.pojo.Admin;

/**
 * @author c1515
 */
public interface AdminService {

    public Admin login(String username, String password);

}
