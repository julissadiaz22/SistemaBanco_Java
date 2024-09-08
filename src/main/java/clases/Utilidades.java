package clases;

import java.util.List;

public class Utilidades {
    public static Bancos obtenerCuentaPorNumero(String numeroCuenta, List<Bancos> bancoList) {
        if (bancoList != null) {
            for (Bancos banco : bancoList) {
                if (banco.getNumeroCuenta().equals(numeroCuenta)) {
                    return banco;
                }
            }
        }
        return null;
    }
}
