package clases;

import java.util.ArrayList;

public class Vendedor {
    private String sucursal;
    private String nomVendedor;
    private double ventas;

    // Constructor
    public Vendedor(String sucursal, String nomVendedor, double ventas) {
        this.sucursal = sucursal;
        this.nomVendedor = nomVendedor;
        this.ventas = ventas;
    }

    // Métodos de acceso
    public String obtenerSucursal() {
        return sucursal;
    }

    public String obtenerNomVendedor() {
        return nomVendedor;
    }

    public double obtenerVentas() {
        return ventas;
    }

    // Métodos estáticos para cálculos
    public static double totalVentas(ArrayList<Vendedor> vendedorList) {
        double total = 0;
        for (Vendedor v : vendedorList) {
            total += v.obtenerVentas();
        }
        return total;
    }

    public static double ventaMayor(ArrayList<Vendedor> vendedorList) {
        double mayor = Double.MIN_VALUE;
        for (Vendedor v : vendedorList) {
            if (v.obtenerVentas() > mayor) {
                mayor = v.obtenerVentas();
            }
        }
        return mayor;
    }

    public static double ventaMenor(ArrayList<Vendedor> vendedorList) {
        double menor = Double.MAX_VALUE;
        for (Vendedor v : vendedorList) {
            if (v.obtenerVentas() < menor) {
                menor = v.obtenerVentas();
            }
        }
        return menor;
    }

    public static int totalEmpSucursalA(ArrayList<Vendedor> vendedorList) {
        int total = 0;
        for (Vendedor v : vendedorList) {
            if (v.obtenerSucursal().equals("A")) {
                total++;
            }
        }
        return total;
    }

    public static int totalEmpSucursalB(ArrayList<Vendedor> vendedorList) {
        int total = 0;
        for (Vendedor v : vendedorList) {
            if (v.obtenerSucursal().equals("B")) {
                total++;
            }
        }
        return total;
    }

    public static int cantTotVendedores(ArrayList<Vendedor> vendedorList) {
        return vendedorList.size();
    }
}
