package com.examen.administrativo.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import com.examen.administrativo.entities.Usuario;
import com.examen.administrativo.repository.EmpresaRepository;
import com.examen.administrativo.repository.UsuarioRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    EmpresaRepository empresaRepository;

    @Autowired
    UsuarioRepository usuarioRepository;

    @Override
    public UserDetails loadUserByUsername(String codigo) throws UsernameNotFoundException {

        Integer id = Integer.valueOf(codigo);

        System.out.println(id);
        Usuario appUser = usuarioRepository.findById(id).orElseThrow(() -> new UsernameNotFoundException("No existe usuario"));
        //System.out.println(appUser);
        // String role = appUser.getRolBean().getDescripcion();

        // // Buscar el usuario con el repositorio y si no existe lanzar una exepcion
        // Ufps appUser2 = ufpsRepository.findById(Integer.valueOf(id))
        //         .orElseThrow(() -> new UsernameNotFoundException("No existe usuario"));

        // Mapear nuestra lista de Authority con la de spring security

        List<GrantedAuthority> grantList = new ArrayList<>();

        GrantedAuthority authority = new SimpleGrantedAuthority(appUser.getRolBean().getDescripcion());
        grantList.add(authority);

        
        // Crear El objeto UserDetails que va a ir en sesion y retornarlo.
        UserDetails usuario = (UserDetails) new User(String.valueOf(appUser.getId()), appUser.getClave(), grantList);
        System.out.println(usuario);
        return usuario;
    }
}

// List<GrantedAuthority> roles = new ArrayList<>();
// GrantedAuthority authority = new SimpleGrantedAuthority(appUser.getEmpresaUsuario().getPerfil());
// roles.add(authority);

// Set <GrantedAuthority> grantList = new HashSet<>();
// GrantedAuthority grantedAuthority = new SimpleGrantedAuthority("USER");
// grantList.add(grantedAuthority);