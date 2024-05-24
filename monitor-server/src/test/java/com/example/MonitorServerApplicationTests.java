package com.example;

import com.example.service.ClientService;
import jakarta.annotation.Resource;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class MonitorServerApplicationTests {

    @Resource
    ClientService clientService;

    @Test
    void contextLoads() {
        String token = clientService.registerToken();
        System.out.println(token);
        System.out.println(clientService.findClientByToken(clientService.registerToken()));

    }
}
