package com.examen.administrativo.repository;

import com.examen.administrativo.entities.Empresa;

import org.springframework.data.jpa.repository.JpaRepository;

public interface EmpresaRepository extends JpaRepository<Empresa,Integer> {
    
}