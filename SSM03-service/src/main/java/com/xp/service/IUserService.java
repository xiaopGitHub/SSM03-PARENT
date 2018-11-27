package com.xp.service;

import com.xp.vo.User;

/**
 * @author xp
 * @create 2018/11/26  9:31
 * @function 用户服务层接口
 */
public interface IUserService {
    /*登陆*/
    User selectUser(String username, String password);
}
