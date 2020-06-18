package examen;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Timestamp;


/**
 * The persistent class for the cormobilidad database table.
 * 
 */
@Entity
@NamedQuery(name="Cormobilidad.findAll", query="SELECT c FROM Cormobilidad c")
public class Cormobilidad implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private byte cancer;

	private byte cardio;

	private byte cerebro;

	private byte corticoides;

	private byte diabetes;

	private byte epoc;

	private Timestamp fechareg;

	private byte fumador;

	private byte nutricion;

	private byte vih;

	//bi-directional one-to-one association to Basico
	@OneToOne
	@JoinColumn(name="id")
	private Basico basico;

	public Cormobilidad() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public byte getCancer() {
		return this.cancer;
	}

	public void setCancer(byte cancer) {
		this.cancer = cancer;
	}

	public byte getCardio() {
		return this.cardio;
	}

	public void setCardio(byte cardio) {
		this.cardio = cardio;
	}

	public byte getCerebro() {
		return this.cerebro;
	}

	public void setCerebro(byte cerebro) {
		this.cerebro = cerebro;
	}

	public byte getCorticoides() {
		return this.corticoides;
	}

	public void setCorticoides(byte corticoides) {
		this.corticoides = corticoides;
	}

	public byte getDiabetes() {
		return this.diabetes;
	}

	public void setDiabetes(byte diabetes) {
		this.diabetes = diabetes;
	}

	public byte getEpoc() {
		return this.epoc;
	}

	public void setEpoc(byte epoc) {
		this.epoc = epoc;
	}

	public Timestamp getFechareg() {
		return this.fechareg;
	}

	public void setFechareg(Timestamp fechareg) {
		this.fechareg = fechareg;
	}

	public byte getFumador() {
		return this.fumador;
	}

	public void setFumador(byte fumador) {
		this.fumador = fumador;
	}

	public byte getNutricion() {
		return this.nutricion;
	}

	public void setNutricion(byte nutricion) {
		this.nutricion = nutricion;
	}

	public byte getVih() {
		return this.vih;
	}

	public void setVih(byte vih) {
		this.vih = vih;
	}

	public Basico getBasico() {
		return this.basico;
	}

	public void setBasico(Basico basico) {
		this.basico = basico;
	}

}