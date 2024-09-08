package clases;

import java.util.Date;

public class Movimiento {
    private String tipoMovimiento; // Puede ser "Depósito" o "Retiro"
    private double monto;
    private Date fecha;

    public Movimiento(String tipoMovimiento, double monto, Date fecha) {
        this.tipoMovimiento = tipoMovimiento;
        this.monto = monto;
        this.fecha = fecha;
    }

    // Getters y Setters
    public String getTipoMovimiento() {
        return tipoMovimiento;
    }

    public void setTipoMovimiento(String tipoMovimiento) {
        this.tipoMovimiento = tipoMovimiento;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
}
