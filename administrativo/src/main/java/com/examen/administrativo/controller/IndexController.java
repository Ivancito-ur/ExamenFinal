package com.examen.administrativo.controller;

import java.util.Optional;

import com.examen.administrativo.entities.Usuario;
import com.examen.administrativo.repository.EmpresaRepository;
import com.examen.administrativo.repository.UsuarioRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/index")
public class IndexController {

    @Autowired
    UsuarioRepository usuarioRepository;

    @Autowired
    EmpresaRepository empresaRepository;
    
    

    @GetMapping("/")
    public String index(Model model) {


        Optional<Usuario> u = usuarioRepository.findById(documentoSession());

        model.addAttribute("u", u.get());



        return "index";
    }



    public Integer documentoSession(){
        Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
        String username =loggedInUser.getName();
        Optional<Usuario> u = usuarioRepository.findById(Integer.valueOf(username));
        return u.get().getId();
    }
}