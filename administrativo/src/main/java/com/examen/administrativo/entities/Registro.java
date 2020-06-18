package com.examen.administrativo.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;
import java.sql.Timestamp;
import java.util.List;


/**
 * The persistent class for the registro database table.
 * 
 */
@Entity
@NamedQuery(name="Registro.findAll", query="SELECT r FROM Registro r")
public class Registro implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private byte covid;

	private byte dificultad;

	private byte fatiga;

	@Temporal(TemporalType.DATE)
	private Date fecha;

	private Timestamp fechareg;

	private byte garganta;

	private byte malestar;

	private byte nasal;

	private BigDecimal temperatura;

	private byte tos;

	//bi-directional many-to-one association to Acceso
	@OneToMany(mappedBy="registroBean")
	private List<Acceso> accesos;

	//bi-directional many-to-one association to Basico
	@ManyToOne
	@JoinColumn(name="persona")
	private Basico basico;

	public Registro() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public byte getCovid() {
		return this.covid;
	}

	public void setCovid(byte covid) {
		this.covid = covid;
	}

	public byte getDificultad() {
		return this.dificultad;
	}

	public void setDificultad(byte dificultad) {
		this.dificultad = dificultad;
	}

	public byte getFatiga() {
		return this.fatiga;
	}

	public void setFatiga(byte fatiga) {
		this.fatiga = fatiga;
	}

	public Date getFecha() {
		return this.fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public Timestamp getFechareg() {
		return this.fechareg;
	}

	public void setFechareg(Timestamp fechareg) {
		this.fechareg = fechareg;
	}

	public byte getGarganta() {
		return this.garganta;
	}

	public void setGarganta(byte garganta) {
		this.garganta = garganta;
	}

	public byte getMalestar() {
		return this.malestar;
	}

	public void setMalestar(byte malestar) {
		this.malestar = malestar;
	}

	public byte getNasal() {
		return this.nasal;
	}

	public void setNasal(byte nasal) {
		this.nasal = nasal;
	}

	public BigDecimal getTemperatura() {
		return this.temperatura;
	}

	public void setTemperatura(BigDecimal temperatura) {
		this.temperatura = temperatura;
	}

	public byte getTos() {
		return this.tos;
	}

	public void setTos(byte tos) {
		this.tos = tos;
	}

	public List<Acceso> getAccesos() {
		return this.accesos;
	}

	public void setAccesos(List<Acceso> accesos) {
		this.accesos = accesos;
	}

	public Acceso addAcceso(Acceso acceso) {
		getAccesos().add(acceso);
		acceso.setRegistroBean(this);

		return acceso;
	}

	public Acceso removeAcceso(Acceso acceso) {
		getAccesos().remove(acceso);
		acceso.setRegistroBean(null);

		return acceso;
	}

	public Basico getBasico() {
		return this.basico;
	}

	public void setBasico(Basico basico) {
		this.basico = basico;
	}

}