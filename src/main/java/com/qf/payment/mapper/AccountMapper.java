package com.qf.payment.mapper;

import com.alibaba.fastjson.JSONObject;
import com.qf.payment.pojo.Account;

import java.util.List;

public interface AccountMapper {
    /**
     * 描述:根据账户id充值
     * @param account 账户信息
     * @return
     * @throws Exception
     */
    int recharge(Account account) throws Exception;

    /**
     * 描述:用户交易
     * @param account
     * @return
     * @throws Exception
     */
    int payment(Account account) throws Exception;

    /**
     * 描述: 用户收款
     * @param account
     * @return
     * @throws Exception
     */
    int gathering(Account account) throws Exception;



    List<Account> listAll(JSONObject jsonObject);

    Integer countSearch(JSONObject jsonObject);

    int deleteRecord(int id);

    void deleteAll(List<String> idList);
}
