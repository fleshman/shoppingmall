package account;

import com.qf.account.mapper.UserMapper;
import com.qf.account.pojo.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * dao层测试类
 * Created by wujiaqin on 2018/10/17.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class UserMapperTest {

    @Autowired
    private UserMapper mapper;

    /**
     * tb_user表插入数据测试
     */
    @Test
    public void testInsert() throws Exception {
        User user = new User();
        user.setUsername("盖聂");
        user.setPassword("gn123");
        user.setIsSeller(0);
        user.setEmail("12483656@163.com");
        user.setNickname("genie");
        user.setPhone("12548864645");

        mapper.insert(user);
    }

    /**
     * tb_user表删除数据测试
     */
    @Test
    public void testDelete() throws Exception {
        User user = new User();
        user.setId(24);

        mapper.delete(user);
    }

    /**
     * tb_user表修改数据测试
     */
    @Test
    public void testUpdate() throws Exception {
        User user = new User();
        user.setId(22);
        user.setUsername("2");
        user.setPassword("2");
        user.setEmail("2@163.com");
        user.setPhone("2");

        mapper.update(user);
    }

    /**
     * tb_user表根据id查找数据测试
     */
    @Test
    public void testSelectById() throws Exception {
        User user = new User();
        user.setId(21);

        User findUser = mapper.selectById(user);
        System.out.println(findUser);
    }

    /**
     * tb_user表根据用户名查找数据测试
     */
    @Test
    public void testSelectByName() throws Exception {
        User user = new User();
        user.setUsername("杨过");

        User findUser = mapper.selectByName(user);
        System.out.println(findUser);
    }

    /**
     * tb_user表查找所有数据测试
     */
    @Test
    public void testSelectAll() throws Exception {
        List<User> users = mapper.selectAll();
        System.out.println(users);
    }

}
