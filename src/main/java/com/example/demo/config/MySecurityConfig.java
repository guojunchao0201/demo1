package com.example.demo.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * @author guojunchao
 */
@Configuration
public class MySecurityConfig extends WebSecurityConfigurerAdapter{

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }


    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable()
                // 表单认证
                .formLogin()
                // 登录页
                .loginPage("/login")
                // 登录表单提交地址
                .loginProcessingUrl("/auth/login")
                .and()
                // 身份认证请求
                .authorizeRequests()
                // URL路径匹配
                .antMatchers("/login").permitAll()
                // 任意请求
                .anyRequest()
                // 身份认证
                .authenticated();
        //super.configure(http);
    }
}
