import 'package:flutter/cupertino.dart';
import 'package:padel_proyecto/modelos/usuario.dart';

class Datos with ChangeNotifier{

  late Usuario _actual ;
  

  Datos (){
    _actual = Usuario();

  }

  Usuario get usuarioActual => this._actual;
  
  set usuarioActual(Usuario value){
    this._actual=value;
    notifyListeners();
  }



} 