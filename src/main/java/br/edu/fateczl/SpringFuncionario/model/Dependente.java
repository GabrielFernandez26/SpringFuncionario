package br.edu.fateczl.SpringFuncionario.model;

public class Dependente {
	private int codigo;
	private String nome;
	private double salario;
	
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
	
	@Override
	public String toString() {
		return "Dependente [codigo=" + codigo + ", nome=" + nome + ", salario=" + salario + "]";
	}
}
