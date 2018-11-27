package com.xp.service.implement;

import com.xp.dao.UserMapper;
import com.xp.service.IUserService;
import com.xp.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * @author xp
 * @create 2018/11/26  9:40
 * @function 登陆实现类
 */
@Service
public class UserService implements IUserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User selectUser(String username, String password) {
        Map<String,Object> map=new HashMap<>();
        map.put("uname", username);
        map.put("upwd", password);
        return userMapper.selectUser(map);
    }
}
