package clases;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Bancos {
    private String numeroCuenta;
    private String nombreCliente;
    private String nombreBanco;
    private double saldo;
    private double interes; // Porcentaje de interés
    private List<Movimiento> movimientos; // Lista de movimientos

    public Bancos(String numeroCuenta, String nombreCliente, String nombreBanco, double saldo, double interes) {
        this.numeroCuenta = numeroCuenta;
        this.nombreCliente = nombreCliente;
        this.nombreBanco = nombreBanco;
        this.saldo = saldo;
        this.interes = interes;
        this.movimientos = new ArrayList<>(); // Inicializamos la lista de movimientos
    }

    // Getters y Setters
    public String getNumeroCuenta() {
        return numeroCuenta;
    }

    public void setNumeroCuenta(String numeroCuenta) {
        this.numeroCuenta = numeroCuenta;
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    public String getNombreBanco() {
        return nombreBanco;
    }

    public void setNombreBanco(String nombreBanco) {
        this.nombreBanco = nombreBanco;
    }

    public double getSaldo() {
        return saldo;
    }

    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }

    public double getInteres() {
        return interes;
    }

    public void setInteres(double interes) {
        this.interes = interes;
    }

    public List<Movimiento> getMovimientos() {
        return movimientos;
    }

    // Métodos de depósito y retiro
    public void depositar(double cantidad) {
        this.saldo += cantidad;
        // Registrar el movimiento
        Movimiento movimiento = new Movimiento("Depósito", cantidad, new Date());
        movimientos.add(movimiento);
    }

    public void retirar(double cantidad) {
        if (cantidad <= this.saldo) {
            this.saldo -= cantidad;
            // Registrar el movimiento
            Movimiento movimiento = new Movimiento("Retiro", cantidad, new Date());
            movimientos.add(movimiento);
        } else {
            System.out.println("No hay suficiente saldo para retirar esa cantidad.");
        }
    }

    public double calcularInteresesSimples(int tiempoEnAnios) {
        return this.saldo * (this.interes / 100) * tiempoEnAnios;
    }
    
    
    
}
