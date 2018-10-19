package com.qf.payment.mapper;

import com.qf.payment.pojo.Balance;
import org.apache.ibatis.annotations.Param;

public interface BalanceMapper {
    int updateBalance(@Param("id") int id, @Param("money") double money);
    double selectBalance(int id);

    int createBalance(int id);
}
