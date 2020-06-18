package com.examen.administrativo.repository;

import com.examen.administrativo.entities.Usuario;

import org.springframework.data.jpa.repository.JpaRepository;

public interface UsuarioRepository extends JpaRepository<Usuario,Integer>{
    
}