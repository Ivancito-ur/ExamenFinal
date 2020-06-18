package com.examen.administrativo.controller;

import com.examen.administrativo.entities.Usuario;
import com.examen.administrativo.repository.EmpresaRepository;
import com.examen.administrativo.repository.RolRepository;
import com.examen.administrativo.repository.UsuarioRepository;
import com.examen.administrativo.utils.PasswordG;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class PruebaController {

    @Autowired
    UsuarioRepository usuarioRepository;

    @Autowired
    EmpresaRepository empresaRepository;

    @Autowired
    RolRepository rolRepository;

    @GetMapping("/montar")
    public String montar() {
       

        PasswordG g = new PasswordG();

        Usuario u = new Usuario();

        //u.setId(1234);
        u.setEmail("ivanmauriciour@ufps.edu.co");
        u.setEmpresaBean(empresaRepository.findById(1).get());
        u.setUsuario("1234");
        u.setClave(g.encriptador("1234"));
        u.setRolBean(rolRepository.findById(1).get());


        usuarioRepository.save(u);

        return "login";
    }
    
}