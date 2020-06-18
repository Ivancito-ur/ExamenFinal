package com.examen.administrativo.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the accesovisitante database table.
 * 
 */
@Entity
@NamedQuery(name="Accesovisitante.findAll", query="SELECT a FROM Accesovisitante a")
public class Accesovisitante implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	@Temporal(TemporalType.DATE)
	private Date fecha;

	private int temperatura;

	//bi-directional many-to-one association to Visitante
	@ManyToOne
	@JoinColumn(name="visitante")
	private Visitante visitanteBean;

	public Accesovisitante() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getFecha() {
		return this.fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public int getTemperatura() {
		return this.temperatura;
	}

	public void setTemperatura(int temperatura) {
		this.temperatura = temperatura;
	}

	public Visitante getVisitanteBean() {
		return this.visitanteBean;
	}

	public void setVisitanteBean(Visitante visitanteBean) {
		this.visitanteBean = visitanteBean;
	}

}