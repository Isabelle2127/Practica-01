import 'practica_01.dart';
import 'dart:io';
void main(){
  Cuenta cuenta = Cuenta(250);

  int opcion = 0;

  while (opcion != 4) {
  stderr.writeln('--- Bienvenido al menu ---');
  stderr.writeln('1. Ver saldo');
  stderr.writeln('2. Depositar');
  stderr.writeln('3. Retirar');
  stderr.writeln('4. Salir');
  stdout.write('Seleccione una opción: ');
  String? opcion = stdin.readLineSync();

  switch (opcion) {
    case '1':
     cuenta.verSaldo();
    break;
    
    case '2':
     stdout.write('Ingrese el monto a depositar: ');
     double monto = double.parse(stdin.readLineSync()!);
     cuenta.depositar(monto);

    break;

    case '3':
      stdout.write('Ingrese el monto a retirar: ');
      double montoRetirar = double.parse(stdin.readLineSync()!);
      cuenta.retirar(montoRetirar);
    break;

    case '4':
     print ('Gracias,vuelva pronto');
     return;

    default:
     print('Opción no válida, intente de nuevo');
    }
  }
  cuenta.mostrarHistorial();
}

/*
PARTE 3 – Análisis del flujo de ejecución
Preguntar para responder:
1. ¿Dónde inicia el programa?
 Inicia en la funcion main

2. ¿Cuándo se crea el objeto?
 Se crea cuando en main se ejecuta Cuenta cuenta = Cuenta();

3. ¿Quién controla la lógica del retiro?
 La clase Cuenta ya que es la que controla todo y la funcion main solo lo ejecuta.

4. ¿Dónde vive el saldo?
 El saldo es un atributo privado, vive dento de la clase cuenta, por lo que solo se accede con
 el metodo de la clase.

5. ¿Por qué no podemos hacer cuenta._saldo = -5000;?
 Porque _saldo al tener _ es un atributo privado por lo que no se puede acceder directamente 
 por ende no se puede modificar directamente, solo a traves de los metodos de la clase.
*/
