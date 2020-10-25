package cn.akwing.sms.service.impl;

import cn.akwing.sms.mapper.AdminMapper;
import cn.akwing.sms.pojo.Admin;
import cn.akwing.sms.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author c1515
 */
@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    public AdminMapper adminMapper;

    @Override
    public Admin login(String id, String password) {
        return adminMapper.login(id, password);
    }
}
