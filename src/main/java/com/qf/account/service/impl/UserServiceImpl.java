package com.qf.account.service.impl;

import com.qf.account.mapper.UserMapper;
import com.qf.account.pojo.User;
import com.qf.account.service.UserSerice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional(isolation = Isolation.READ_COMMITTED,propagation = Propagation.REQUIRED)
public class UserServiceImpl implements UserSerice {

    @Autowired
    private UserMapper mapper;

    @Override
    public void save(User user) throws Exception {
        mapper.insert(user);
    }

    @Override
    public void remove(User user) throws Exception {
        mapper.delete(user);
    }

    @Override
    public void modify(User user) throws Exception {
        mapper.update(user);
    }

    @Override
    @Transactional(readOnly = true)
    public User findById(User user) throws Exception {
        return mapper.selectById(user);
    }

    @Override
    @Transactional(readOnly = true)
    public User findByName(User user) throws Exception {
        return mapper.selectByName(user);
    }

    @Override
    @Transactional(readOnly = true)
    public List<User> findAll() throws Exception {
        return mapper.selectAll();
    }
}
