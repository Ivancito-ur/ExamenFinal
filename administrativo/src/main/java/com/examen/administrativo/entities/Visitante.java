package com.examen.administrativo.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the visitante database table.
 * 
 */
@Entity
public class Visitante implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private String documento;

	private int eps;

	@Temporal(TemporalType.DATE)
	private Date fechanacimiento;

	private String genero;

	private String nombre;

	//bi-directional many-to-one association to Accesovisitante
	@OneToMany(mappedBy="visitanteBean")
	private List<Accesovisitante> accesovisitantes;

	//bi-directional many-to-one association to Empresa
	@ManyToOne
	@JoinColumn(name="empresa")
	private Empresa empresaBean;

	public Visitante() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDocumento() {
		return this.documento;
	}

	public void setDocumento(String documento) {
		this.documento = documento;
	}

	public int getEps() {
		return this.eps;
	}

	public void setEps(int eps) {
		this.eps = eps;
	}

	public Date getFechanacimiento() {
		return this.fechanacimiento;
	}

	public void setFechanacimiento(Date fechanacimiento) {
		this.fechanacimiento = fechanacimiento;
	}

	public String getGenero() {
		return this.genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public List<Accesovisitante> getAccesovisitantes() {
		return this.accesovisitantes;
	}

	public void setAccesovisitantes(List<Accesovisitante> accesovisitantes) {
		this.accesovisitantes = accesovisitantes;
	}

	public Accesovisitante addAccesovisitante(Accesovisitante accesovisitante) {
		getAccesovisitantes().add(accesovisitante);
		accesovisitante.setVisitanteBean(this);

		return accesovisitante;
	}

	public Accesovisitante removeAccesovisitante(Accesovisitante accesovisitante) {
		getAccesovisitantes().remove(accesovisitante);
		accesovisitante.setVisitanteBean(null);

		return accesovisitante;
	}

	public Empresa getEmpresaBean() {
		return this.empresaBean;
	}

	public void setEmpresaBean(Empresa empresaBean) {
		this.empresaBean = empresaBean;
	}

}