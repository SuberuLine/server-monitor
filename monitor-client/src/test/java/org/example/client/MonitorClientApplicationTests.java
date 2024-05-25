package org.example.client;

import jakarta.annotation.Resource;
import org.example.client.utils.MonitorUtils;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class MonitorClientApplicationTests {

    @Resource
    MonitorUtils monitorUtils;

    @Test
    void contextLoads() {
        System.out.println(monitorUtils.monitorBaseDetail());
    }

}
