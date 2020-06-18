package examen;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the tipo database table.
 * 
 */
@Entity
@NamedQuery(name="Tipo.findAll", query="SELECT t FROM Tipo t")
public class Tipo implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private String descripcion;

	//bi-directional many-to-one association to Basico
	@OneToMany(mappedBy="tipoBean")
	private List<Basico> basicos;

	//bi-directional many-to-one association to Empresa
	@ManyToOne
	@JoinColumn(name="empresa")
	private Empresa empresaBean;

	public Tipo() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public List<Basico> getBasicos() {
		return this.basicos;
	}

	public void setBasicos(List<Basico> basicos) {
		this.basicos = basicos;
	}

	public Basico addBasico(Basico basico) {
		getBasicos().add(basico);
		basico.setTipoBean(this);

		return basico;
	}

	public Basico removeBasico(Basico basico) {
		getBasicos().remove(basico);
		basico.setTipoBean(null);

		return basico;
	}

	public Empresa getEmpresaBean() {
		return this.empresaBean;
	}

	public void setEmpresaBean(Empresa empresaBean) {
		this.empresaBean = empresaBean;
	}

}