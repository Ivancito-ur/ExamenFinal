package com.examen.administrativo.entities;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the usuario database table.
 * 
 */
@Entity
@NamedQuery(name="Usuario.findAll", query="SELECT u FROM Usuario u")
public class Usuario implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private String clave;

	private String email;

	private String usuario;

	//bi-directional many-to-one association to Empresa
	@ManyToOne
	@JoinColumn(name="empresa")
	private Empresa empresaBean;

	//bi-directional many-to-one association to Rol
	@ManyToOne
	@JoinColumn(name="rol")
	private Rol rolBean;

	public Usuario() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(final int id) {
		this.id = id;
	}

	public String getClave() {
		return this.clave;
	}

	public void setClave(final String clave) {
		this.clave = clave;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(final String email) {
		this.email = email;
	}

	public String getUsuario() {
		return this.usuario;
	}

	public void setUsuario(final String usuario) {
		this.usuario = usuario;
	}

	public Empresa getEmpresaBean() {
		return this.empresaBean;
	}

	public void setEmpresaBean(final Empresa empresaBean) {
		this.empresaBean = empresaBean;
	}

	public Rol getRolBean() {
		return this.rolBean;
	}

	public void setRolBean(final Rol rolBean) {
		this.rolBean = rolBean;
	}

}