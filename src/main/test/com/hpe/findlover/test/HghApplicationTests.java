package com.hpe.findlover.test;

import com.hpe.findlover.model.UserBasic;
import com.hpe.findlover.service.UserService;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.util.ByteSource;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class HghApplicationTests {
    @Autowired
    private UserService userService;

	@Test
	public void contextLoads() {
        UserBasic userBasic = userService.selectByPrimaryKey(100012);
        userBasic.setPassword(new Md5Hash("123456", ByteSource.Util.bytes(userBasic.getEmail())).toString());
        boolean result = userService.updateByPrimaryKeySelective(userBasic);
		System.out.println(result);
	}


}
