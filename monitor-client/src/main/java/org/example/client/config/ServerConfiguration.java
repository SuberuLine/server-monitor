package org.example.client.config;

import com.alibaba.fastjson2.JSONObject;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.example.client.MonitorClientApplication;
import org.example.client.entity.ConnectionConfig;
import org.example.client.utils.MonitorUtils;
import org.example.client.utils.NetUtils;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Scanner;

@Configuration
@Slf4j
public class ServerConfiguration {

    @Resource
    NetUtils net;

    @Resource
    MonitorUtils monitorUtils;

    @Bean
    ConnectionConfig connectionConfig(MonitorClientApplication monitorClientApplication) {
        log.info("正在加载服务连接配置");
        ConnectionConfig config = this.readConfigurationFromFile();
        if (config == null)
            config = this.registerToServer();
        System.out.println(monitorUtils.monitorBaseDetail());
        return config;
    }

    private ConnectionConfig registerToServer() {
        Scanner scanner = new Scanner(System.in);
        String token, address;
        do {
            log.info("请输入需要注册地服务端访问地址，如 http://192.168.0.1:8080 ：");
            address = scanner.nextLine();
            log.info("请输入服务端生成的Token：");
            token = scanner.nextLine();
        } while (!net.registerToServer(address, token)); {
            ConnectionConfig config = new ConnectionConfig(address, token);
            this.saveConfigurationToFile(config);
            return config;
        }
    }

    private void saveConfigurationToFile(ConnectionConfig config) {
        File dir = new File("config");
        if (!dir.exists() && dir.mkdir()) {
            log.info("配置文件创建成功");
        }
        File file = new File("config/server.json");
        try (FileWriter writer = new FileWriter(file)) {
            writer.write(JSONObject.from(config).toJSONString());
        } catch (IOException e) {
            log.error("保存配置文件时出错：", e);
        }
        log.info("服务器连接信息已保存成功！");
    }

    private ConnectionConfig readConfigurationFromFile() {
        File configurationFile = new File("config/server.json");
        if (configurationFile.exists()){
            try (FileInputStream stream = new FileInputStream(configurationFile)) {
                String raw = new String(stream.readAllBytes(), StandardCharsets.UTF_8);
                return JSONObject.parseObject(raw).to(ConnectionConfig.class);
            } catch (IOException e) {
                log.error("读取配置文件时出错:", e);
            }
        }
        return null;
    }
}
