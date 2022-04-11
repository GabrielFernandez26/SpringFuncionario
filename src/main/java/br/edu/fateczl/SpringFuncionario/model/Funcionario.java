package br.edu.fateczl.SpringFuncionario.model;

import java.util.ArrayList;
import java.util.List;

public class Funcionario {
	public List<Dependente> dependentes;
	public int codigo;
	public String nome;
	public double salario;
	
	public Funcionario() {
		this.dependentes = new ArrayList<Dependente>();
	}
	
	public List<Dependente> getTimes() {
		return dependentes;
	}

	public void addDependente(Dependente dependente) {
		this.dependentes.add(dependente);
	}
	
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public double getSalario() {
		return salario;
	}
	public void setSalario(double salario) {
		this.salario = salario;
	}
	
	
}
