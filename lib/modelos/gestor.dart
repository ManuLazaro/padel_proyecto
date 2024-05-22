import 'package:padel_proyecto/modelos/usuario.dart';

class Gestor extends Usuario{

  //int _id = 0;
  String centroDeportivo="";
  int numPistas=0;
  String direccion="";
  String telefonoContacto="";
  
  

  //constructor
  Gestor() {
    this.id = 0;
    this.centroDeportivo = '';
    this.numPistas = 0;
    this.direccion = '';
    this.telefonoContacto = '';
  }
  //constructor sin _id
  Gestor.without_id(this.centroDeportivo, this.numPistas, this.direccion, this.telefonoContacto);
  //constructor con _id
  //Gestor.with_id(super.id, this.centroDeportivo, this.numPistas, this.direccion, this.telefonoContacto);

  Gestor.with_id(int id, String centro, int pistas, String dir, String telefono)
  {
    this.id=id;
    this.centroDeportivo=centro;
    this.numPistas=pistas;
    this.direccion=dir;
    this.telefonoContacto=telefono;
  }
  //constructor con map
  Gestor.fromMap(Map<String, dynamic> map) {
    this.id = (map['id']!=null)?map['id']:null;
    this.centroDeportivo = (map['centroDeportivo']!=null)?map['centroDeportivo']:'';
    this.numPistas = (map['numPistas']!=null)?map['numPistas']:'';
    this.direccion = (map['direccion']!=null)?map['direccion']:'';
    this.telefonoContacto = (map['telefonoContacto']!=null)?map['telefonoContacto']:'';
  }
  
  //Getters y setters 
  //int? get id => _id;
  String get _centroDeportivo => centroDeportivo;
  int get _numPistas => numPistas;
  String get _direccion => direccion;
  
  set _centroDeportivo(String _centroDeportivo) {
    this.centroDeportivo = _centroDeportivo;
  }
  set _numPistas(int _numPistas) {
    this.numPistas = _numPistas;
  }
  set _direccion(String _direccion) {
    this.direccion = _direccion;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) map['_id'] = id;
    map['centroDeportivo'] = centroDeportivo;
    map['numPistas'] = numPistas;
    map['direccion'] = direccion;
    return map;
  }
}
