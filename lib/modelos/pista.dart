import 'dart:html';

import 'base_de_datos.dart';

class Pista {

  int id = 0;
  String direccion="";
  DateTime fecha=DateTime.now(); 
  String pista="";
  String hora="";
  int precio=0;
  

    Pista() {
    id = 0;
    direccion = "";
    fecha = DateTime.now(); 
    pista = "";
    hora = ""; 
    precio = 0;
  }
  
  //constructor sin id
  Pista.withoutId(this.direccion, this.fecha, this.pista, this.hora,this.precio);
  //constructor con id
  Pista.withId(this.id, this.direccion, this.fecha, this.pista, this.hora, this.precio);
  //constructor con map
  Pista.fromMap(Map<String, dynamic> map) {
    this.id = (map['id']!=null)?map['id']:null;
    this.direccion = (map['direccion']!=null)?map['direccion']:'';
    this.fecha = DateTime.parse(map['fecha']);
    this.pista = (map['pista']!=null)?map['pista']:'';
    this.hora = (map['hora']!=null)?map['hora']:'';
    this.precio = (map['precio']!=null)?map['precio']:'';
  }
  
  //Getters y setters 
  int? get _id => id;
  String get _direccion => direccion;
  DateTime get _fecha => fecha;
  String get _pista => pista;
  String get _hora => hora;
  int get _precio => precio;
  

  set _direccion(String _direccion) {
    this.direccion = _direccion;
  }
  set _fecha(DateTime _fecha) {
    this.fecha = _fecha;
  }
  set _pista(String _pista) {
    this.pista = _pista;
  }
  set _hora(String _hora) {
    this.hora = _hora;
  }
  set _precio(int _precio) {
    this.precio = _precio;
  }
  
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null) map['id'] = _id;
    map['direccion'] = direccion;
    map['fecha'] = fecha.toString();
    map['pista'] = pista;
    map['hora'] = hora;
    map['precio'] = precio;
    return map;
  }
  // Obtener lista de pistas
  Future<List<Pista>> getUsuarios(bool modoLocal)async{
    List<Pista> listaPistas = []; // Inicializar lista vacía de pistas
    Pista pista = new Pista(); // objeto pista
    DateTime fecha = DateTime.now();
    if(modoLocal){
      // codigo conexion base de datos con sqlite
      DBHelper dbHelper = DBHelper();
      List<Map<String, dynamic>> pistas = await dbHelper.consultarTabla("pistas");

      for(int i = 0; i< pistas.length; i++){
        pista = Pista.fromMap(pistas[i]);
        listaPistas.add(pista);
      }
    }else{
      //codigo para la conexion con el API
    }
    return listaPistas;
  }
}

