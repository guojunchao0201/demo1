package com.example.demo.config;

import org.springframework.security.crypto.password.PasswordEncoder;

//@Component
public class MyPasswordEncode implements PasswordEncoder {
    @Override
    public String encode(CharSequence charSequence) {
        return charSequence.toString();
    }

    @Override
    public boolean matches(CharSequence charSequence, String s) {
        return s.equals(charSequence);
    }
}
