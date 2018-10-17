package com.qf.payment.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.qf.payment.mapper.AccountMapper;
import com.qf.payment.mapper.BalanceMapper;
import com.qf.payment.pojo.Account;
import com.qf.payment.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class AccountServiceImpl implements AccountService {
    @Autowired
    private AccountMapper accountMapper;
    @Autowired
    private BalanceMapper balanceMapper;
    //充值
    @Override
    public int recharge(Account account) throws Exception {
        account.setCreateTime(new Date());
        int n = balanceMapper.updateBalance(account.getuId(),-account.getMoney());
        n += accountMapper.recharge(account);
        return n;
    }

    // 交易
    @Override
    public int transfer(int id,double money, int pid) throws Exception {
        double findAccount = balanceMapper.selectBalance(id);
        if(findAccount>= money){
            Account account = new Account();
            account.setuId(id);
            // 根据商品的id 查询 卖家的id
            int toId = 0;
            account.setToId(id);
            account.setMoney(money);
            account.setCreateTime(new Date());
            account.setFromId(toId);
            int n = accountMapper.payment(account);
            n += accountMapper.gathering(account);
            balanceMapper.updateBalance(id,-money);
            balanceMapper.updateBalance(toId,money);
            return n;
        }else {
            return 0;
        }
    }

    // 退款
    @Override
    public int refund(int id, double money, int pid) throws Exception {
        // 根据商品的id 查询 卖家的id
        int sid = 0;
        double findAccount = balanceMapper.selectBalance(sid);
        if(findAccount>=money){
            Account account = new Account();
            account.setMoney(money);
            account.setFromId(sid);
            account.setToId(id);
            account.setCreateTime(new Date());
            int n = accountMapper.payment(account);
            n += accountMapper.gathering(account);
            balanceMapper.updateBalance(id,-money);
            balanceMapper.updateBalance(sid,money);

            return n;
        }

        return 0;
    }

    @Override
    public JSONObject listAll(JSONObject jsonObject) {
        List<Account> accounts= accountMapper.listAll(jsonObject);
        long n = accountMapper.countSearch(jsonObject);
        jsonObject.put("rows",accounts);
        jsonObject.put("total",n);
        return jsonObject;
    }

    @Override
    public int deleteRecord(int id) {

        return accountMapper.deleteRecord(id);
    }
}
