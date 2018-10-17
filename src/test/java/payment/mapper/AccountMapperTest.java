package payment.mapper;

import com.qf.payment.mapper.AccountMapper;
import com.qf.payment.pojo.Account;
import org.hamcrest.core.IsEqual;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

import static org.hamcrest.core.IsEqual.equalTo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@Transactional
public class AccountMapperTest {
    @Autowired
    private AccountMapper accountMapper;
    @Test
    @Rollback
    public void testRecharge() throws Exception{
        Account account = new Account();
        account.setMoney(100.0);
        account.setId(1);
        account.setCreateTime(new Date());
        int n = accountMapper.recharge(account);
        Assert.assertThat(n, equalTo(1));
    }
    @Rollback
    @Test
    public void testPayment() throws Exception{
        Account account = new Account();
        account.setCreateTime(new Date());
        account.setMoney(100.0);
        account.setId(1);
        account.setToId(2);
        int n = accountMapper.payment(account);
        Assert.assertThat(n,equalTo(1));
    }

    @Rollback
    @Test
    public void testGathering() throws Exception{
        Account account = new Account();
        account.setToId(1);
        account.setMoney(100.0);
        account.setCreateTime(new Date());
        int n = accountMapper.gathering(account);
        Assert.assertThat(n,equalTo(1));
    }
}
