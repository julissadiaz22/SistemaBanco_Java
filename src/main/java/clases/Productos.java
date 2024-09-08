package clases;

import java.util.ArrayList;

public class Productos {
    private String nombreProducto;
    private int cantidad;
    private double precioUnitario;

    // Constructor
    public Productos(String nombreProducto, int cantidad, double precioUnitario) {
        this.nombreProducto = nombreProducto;
        this.cantidad = cantidad;
        this.precioUnitario = precioUnitario;
    }

    // Getters y Setters
    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getPrecioUnitario() {
        return precioUnitario;
    }

    public void setPrecioUnitario(double precioUnitario) {
        this.precioUnitario = precioUnitario;
    }

      public static double calcularSubtotal(ArrayList<Productos> productoList) {
        double subtotal = 0.0;
        for (Productos producto : productoList) {
            subtotal += producto.getCantidad() * producto.getPrecioUnitario();
        }
        return subtotal;
    }

    public static double calcularIVA(ArrayList<Productos> productoList) {
        double subtotal = calcularSubtotal(productoList);
        return subtotal * 0.13; 
    }

    public static double calcularTotal(ArrayList<Productos> productoList) {
        double subtotal = calcularSubtotal(productoList);
        double iva = calcularIVA(productoList);
        return subtotal + iva;
    }
}
