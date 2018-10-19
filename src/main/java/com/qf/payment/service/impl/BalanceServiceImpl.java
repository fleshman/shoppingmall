package com.qf.payment.service.impl;

import com.qf.payment.mapper.BalanceMapper;
import com.qf.payment.service.BalanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BalanceServiceImpl implements BalanceService{
    @Autowired
    private BalanceMapper balanceMapper;

    @Override
    public double selectBalance(int id) {

        return balanceMapper.selectBalance(id);
    }

    @Override
    public int createBalance(int id) {

        return balanceMapper.createBalance(id);
    }
}
