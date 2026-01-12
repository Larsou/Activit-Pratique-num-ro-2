package com.example.customerservice.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;

@ConfigurationProperties(prefix = "customer.params")
@EnableConfigurationProperties(CustomerConfigParams.class)
public record CustomerConfigParams(int x, int y) {
}
