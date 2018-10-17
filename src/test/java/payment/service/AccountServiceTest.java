package payment.service;

import com.qf.payment.mapper.AccountMapper;
import com.qf.payment.pojo.Account;
import com.qf.payment.service.AccountService;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import static org.hamcrest.core.IsEqual.equalTo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@Transactional
public class AccountServiceTest {
    @Autowired
    private AccountService accountService;
    @Test
    @Rollback
    public void testRechage() throws Exception{
        Account account = new Account();
        account.setId(1);
        int n = accountService.recharge(account);
        Assert.assertThat(n,equalTo(1));
    }
    @Test
    @Rollback
    public void testTransfer() throws Exception{
        Account account = new Account();
        double money = 200.0;
        int id = 1;
        int pid = 1;
        account.setId(1);
        account.setToId(2);
        int n = accountService.transfer(id,money,pid);
        Assert.assertThat(n,equalTo(2));
    }
}
