// Simulación de Cajero Bancario en Consola

/*
Contexto: Vamos a simular un cajero automático básico que permita:
• Ver saldo
• Depositar
• Retirar
• Salir
Preguntas antes de programar
1. ¿Qué clase necesitamos?
    Cuenta 
2. ¿Qué atributos debe tener?
    Saldo, historial de operaciones, número de cuenta
3. ¿Qué métodos necesita?
    Ver saldo, depositar, retirar, mostrar historial
4. ¿Dónde inicia el programa?
    En la función main, donde se crea el objeto Cuenta y se muestra el menú
*/

// Parte 2 - Construcción del la practica
class Cuenta {
  double _saldo;
  int _intentosFallidos = 0;
  int _contadorOperaciones = 0;
  bool _bloqueada = false;

  Cuenta(this._saldo);

  double get saldo => _saldo;
  bool get bloqueada => _bloqueada;

  void verSaldo(){
    if (_bloqueada) {
      print('Cuenta bloqueda, no se puede mostrar el saldo');
    } else {
      print('Saldo actual: \$$_saldo');
    }
  }

  void depositar(double monto){
    if (_bloqueada) {
      print('Cuenta bloqueda, no se puede depositar');
    } else if (monto < 0) {
      print('No se puede depositar un monto negativo');
    } else {
    _saldo += monto;
    _contadorOperaciones++;
    print('Depósito exitoso. Nuevo saldo: \$$_saldo');
    }
  }

  void retirar(double monto){

    if (_bloqueada) {
      print('Cuenta bloqueda, no se puede retirar');
      return;
    }
    if (monto <= 0) {
      print('Cantidad inválida, intente de nuevo');
      return;
    }
    if (monto > _saldo) {
      _intentosFallidos++;
      print('Saldo insuficiente');
      print('Intentos fallidos: $_intentosFallidos');

      if (_intentosFallidos == 3) {
        _bloqueada = true;
        print('Cuenta bloqueada por intentos fallidos');
      }
      return;
    }
    _saldo -= monto;
    _contadorOperaciones++;
    _intentosFallidos = 0; 
    print ('Retiro exitoso');
  }

  void mostrarHistorial(){
    print ('Operaciones realizadas: $_contadorOperaciones');
  }
}


/*
PARTE 4 – Reto incremental (Nivel medio)
Agregar:
1. Validar que no se depositen números negativos
2. Mostrar historial simple (contador de operaciones)
3. Bloquear cuenta si intenta retirar 3 veces sin saldo suficiente */
