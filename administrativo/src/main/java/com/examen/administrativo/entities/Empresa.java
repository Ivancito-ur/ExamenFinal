package com.examen.administrativo.entities;

import java.io.Serializable;
import javax.persistence.*;

import lombok.Data;

import java.util.List;


/**
 * The persistent class for the empresa database table.
 * 
 */
@Data
@Entity
public class Empresa implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private String code;

	private String endpoint;

	private byte estado;

	private String nombre;

	//bi-directional many-to-one association to Tipo
	@OneToMany(mappedBy="empresaBean")
	private List<Tipo> tipos;

	//bi-directional many-to-one association to Usuario
	@OneToMany(mappedBy="empresaBean")
	private List<Usuario> usuarios;

	//bi-directional many-to-one association to Visitante
	@OneToMany(mappedBy="empresaBean")
	private List<Visitante> visitantes;

	public Empresa() {
	}

	

}