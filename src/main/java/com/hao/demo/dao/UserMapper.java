package com.hao.demo.dao;


import com.hao.demo.entity.User;

import java.util.List;

public interface UserMapper {
    //查询所有的USER对象
    public List<User> userList();
}
