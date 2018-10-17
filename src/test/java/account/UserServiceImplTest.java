package account;

import com.qf.account.pojo.User;
import com.qf.account.service.UserSerice;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * service层测试类
 * Created by wujiaqin on 2018/10/17.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class UserServiceImplTest {

    @Autowired
    private UserSerice service;

    /**
     * tb_user表插入数据测试
     */
    @Test
    public void testSave() throws Exception {
        User user = new User();
        user.setUsername("盖聂");
        user.setPassword("gn123");
        user.setIsSeller(0);
        user.setEmail("12483656@163.com");
        user.setNickname("genie");
        user.setPhone("12548864645");

        service.save(user);
    }

    /**
     * tb_user表删除数据测试
     */
    @Test
    public void testRemove() throws Exception {
        User user = new User();
        user.setId(23);

        service.remove(user);
    }

    /**
     * tb_user表修改数据测试
     */
    @Test
    public void testModify() throws Exception {
        User user = new User();
        user.setId(23);
        user.setUsername("2");
        user.setPassword("2");
        user.setEmail("2@163.com");
        user.setPhone("2");

        service.modify(user);
    }

    /**
     * tb_user表根据id查找数据测试
     */
    @Test
    public void testFindById() throws Exception {
        User user = new User();
        user.setId(21);

        User findUser = service.findById(user);
        System.out.println(findUser);
    }

    /**
     * tb_user表根据用户名查找数据测试
     */
    @Test
    public void testFindByName() throws Exception {
        User user = new User();
        user.setUsername("杨过");

        User findUser = service.findByName(user);
        System.out.println(findUser);
    }

    /**
     * tb_user表查找所有数据测试
     */
    @Test
    public void testFindAll() throws Exception {
        List<User> users = service.findAll();

        System.out.println(users);
    }
}