package com.qf.account.mapper;

import com.qf.account.pojo.User;

import java.util.List;

public interface UserMapper {

    /**
     * 插入数据
     */
    public void insert(User user)throws Exception;

    /**
     * 根据id删除数据
     */
    public void delete(User user)throws Exception;

    /**
     * 根据id修改数据
     */
    public void update(User user)throws Exception;

    /**
     * 根据id查找用户信息
     */
    public User selectById(User user)throws Exception;

    /**
     * 根据用户名查找用户信息
     */
    public User selectByName(User user)throws Exception;

    /**
     * 查找所有用户信息
     */
    public List<User> selectAll()throws Exception;

}
