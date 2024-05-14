import 'package:flutter/cupertino.dart';
import 'package:padel_proyecto/modelos/usuario.dart';

class DatosUsuario with ChangeNotifier{

  late Usuario _actual ;


  DatosUsuario (){
    _actual = Usuario();
  }

  Usuario get usuarioActual => this._actual;
  
  set usuarioActual(Usuario value){
    this._actual=value;
    notifyListeners();
  }



} 