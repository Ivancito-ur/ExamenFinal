package com.examen.administrativo.controller;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import com.examen.administrativo.entities.Empresa;
import com.examen.administrativo.entities.Usuario;
import com.examen.administrativo.repository.EmpresaRepository;
import com.examen.administrativo.repository.RolRepository;
import com.examen.administrativo.repository.UsuarioRepository;
import com.examen.administrativo.utils.PasswordG;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/index")
public class IndexController {

    @Autowired
    UsuarioRepository usuarioRepository;

    @Autowired
    EmpresaRepository empresaRepository;
    
    @Autowired
    RolRepository rolRepository;
    

    @GetMapping("/")
    public String index(Model model) {
        Optional<Usuario> u = usuarioRepository.findById(documentoSession());
        model.addAttribute("u", u.get());
        return "index";
    }

    @GetMapping("/tabla_visitante")
    public String tablaVisitante() {
        

        return "tabla_visitante";
    }


    @GetMapping("/tabla_usuarios")
    public String tablaUsuario(Model model) {
        Optional<Usuario> u = usuarioRepository.findById(documentoSession());
        Optional<Empresa> e = empresaRepository.findById(u.get().getEmpresaBean().getId());
        
        model.addAttribute("e", e.get());
        model.addAttribute("u", u.get());
        return "tabla_usuarios";
    }

    @PostMapping("/accion/{id:.+}")
    public String crud(@PathVariable String id , HttpServletRequest request, Model model) {

        if (!id.equals("add")) {            
            Optional<Usuario> u = usuarioRepository.findById(Integer.valueOf(request.getParameter("id")));
            
            if(id.equalsIgnoreCase("delete")){
                usuarioRepository.delete(u.get());
            }
            else if(id.equalsIgnoreCase("update")){
                model.addAttribute("u", u.get());
                model.addAttribute("accion","Actualizar");
                return "add_update";
            }
        }
        else{
            Usuario n = new Usuario();
            model.addAttribute("u", n);
            model.addAttribute("accion","Actualizar");
            return "add_update";
        }
        return "redirect:/index/tabla_usuarios";
    }

    @PostMapping("/save")
    public String save(HttpServletRequest request) {

        Usuario a = usuarioRepository.findById(documentoSession()).get();
        
        PasswordG p = new PasswordG();
        Usuario u = new Usuario();

        int id =0;
        System.out.println(request.getParameter("id") );
        boolean f = request.getParameter("id") == null;
        if (!f) {
            id = Integer.valueOf(request.getParameter("id"));
            u.setId(id);            
        }

        String usuario = request.getParameter("usuario");
        String email = request.getParameter("email");
        String rol = request.getParameter("rol");
        int aux=0;
        if (rol.equalsIgnoreCase("administrador")) {
            aux=1;
        }
        String clave= request.getParameter("clave");
        


        u.setUsuario(usuario);
        u.setEmail(email);
        u.setRolBean(rolRepository.findById(aux).get());
        u.setEmpresaBean(empresaRepository.findById(a.getEmpresaBean().getId()).get());
        u.setClave(p.encriptador(clave));

        
        usuarioRepository.save(u);


        return "redirect:/index/tabla_usuarios";
    }


    public Integer documentoSession(){
        Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
        String username =loggedInUser.getName();
        Optional<Usuario> u = usuarioRepository.findById(Integer.valueOf(username));
        return u.get().getId();
    }


}