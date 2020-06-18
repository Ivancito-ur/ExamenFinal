package com.examen.administrativo.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Timestamp;


/**
 * The persistent class for the acceso database table.
 * 
 */
@Entity
@NamedQuery(name="Acceso.findAll", query="SELECT a FROM Acceso a")
public class Acceso implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private int estado;

	private Timestamp fechareg;

	//bi-directional many-to-one association to Registro
	@ManyToOne
	@JoinColumn(name="registro")
	private Registro registroBean;

	public Acceso() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getEstado() {
		return this.estado;
	}

	public void setEstado(int estado) {
		this.estado = estado;
	}

	public Timestamp getFechareg() {
		return this.fechareg;
	}

	public void setFechareg(Timestamp fechareg) {
		this.fechareg = fechareg;
	}

	public Registro getRegistroBean() {
		return this.registroBean;
	}

	public void setRegistroBean(Registro registroBean) {
		this.registroBean = registroBean;
	}

}