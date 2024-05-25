import 'package:flutter/cupertino.dart';
import 'package:padel_proyecto/modelos/pista.dart';
import 'package:padel_proyecto/modelos/usuario.dart';

class Datos with ChangeNotifier{

  late Usuario _actual ; // PARA LOS DATOS DEL USUARIO
  late Pista _pistaSeleccionada; // PARA LOS DATOS DE LA PISTA



//constructro
  Datos (){
    _actual = Usuario(); // PARA LOS DATOS DEL USUARIO
    _pistaSeleccionada = Pista();// PARA LOS DATOS DE LA PISTA
  }



//Getter y setters
  Usuario get usuarioActual => this._actual;// PARA LOS DATOS DEL USUARIO
  Pista get pistaSeleccionada => this._pistaSeleccionada;// PARA LOS DATOS DE LA PISTA
  
  set usuarioActual(Usuario value){// PARA LOS DATOS DEL USUARIO
    this._actual=value;
    notifyListeners();
  }
  set pistaSeleccionada(Pista value) {// PARA LOS DATOS DE LA PISTA
    this._pistaSeleccionada = value;
    notifyListeners();
  }
  


} 