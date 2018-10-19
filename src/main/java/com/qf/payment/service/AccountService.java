package com.qf.payment.service;

import com.alibaba.fastjson.JSONObject;
import com.qf.payment.pojo.Account;

import java.util.List;

public interface AccountService {
    int recharge(Account account) throws Exception;

    int transfer(int id,double money,int pid) throws Exception;

    int refund(int id,double money,int pid) throws Exception;
    JSONObject listAll(JSONObject jsonObject);

    int deleteRecord(int id);

    void deleteAll(List<String> idList);
}
