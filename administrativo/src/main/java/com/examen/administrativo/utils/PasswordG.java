package com.examen.administrativo.utils;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordG {
    BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(4);


    public String encriptador(String password) {

        return encoder.encode(password);
        
    }
}