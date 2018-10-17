package com.qf.account.service;

import com.qf.account.pojo.User;
import java.util.List;

public interface UserSerice {

    /**
     * 插入数据
     */
    public void save(User user)throws Exception;

    /**
     * 根据id删除数据
     */
    public void remove(User user)throws Exception;

    /**
     * 根据id修改数据
     */
    public void modify(User user)throws Exception;

    /**
     * 根据id查找用户信息
     */
    public User findById(User user)throws Exception;

    /**
     * 根据用户名查找用户信息
     */
    public User findByName(User user)throws Exception;

    /**
     * 查找所有用户信息
     */
    public List<User> findAll()throws Exception;
}
