package org.service.client;

import io.swagger.annotations.Api;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.sleuth.Sampler;
import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@EnableDiscoveryClient
@EnableWebMvc
@SpringBootApplication
@Api(value = "service-client", description = "All operations for the service-client.")
public class Application {

    @Bean
    Sampler sampler() {
        return span -> true;
    }

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

}