package payment;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class UserMapperTest {
    @Autowired
    UserMapper userMapper;


   /*
   * 测试插入用户
   * */
    @Test
    public void testSave() throws Exception{
        User user = new User();
        user.setNickname("xiaolili");
        userMapper.insertSelective(user);
    }


}
