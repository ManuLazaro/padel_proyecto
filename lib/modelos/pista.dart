import 'package:padel_proyecto/modelos/jugador.dart';

import 'base_de_datos.dart';

class Pista {

  int _id = 0;
  String _direccion="";
  DateTime _fecha=DateTime.now(); 
  String _nombrePista="";
  String _hora="";
  int _precio=0;
  int _jugadores= 0; // jugadores apuntados totales
  int _idJ1=0; // player 1 ......
  int _idJ2=0;
  int _idJ3=0;
  int _idJ4=0;
  int _resultado=0; // si es 0 el partido no se ha jugado, si es <0 hay ganado J3 y J4 y si es >0 J1 y J2
  

    Pista() {
    _id = 0;
    _direccion = "";
    _fecha = DateTime.now(); 
    _nombrePista = "";
    _hora = ""; 
    _precio = 0;
  }
  
  //constructor sin _id
  Pista.withoutId(this._direccion, this._fecha, this._nombrePista, this._hora,this._precio);
  //constructor con _id
  Pista.withId(this._id, this._direccion, this._fecha, this._nombrePista, this._hora, this._precio);
  //constructor con map
  Pista.fromMap(Map<String, dynamic> map) {
    this._id = (map['id']!=null)?map['id']:null;
    this._direccion = (map['direccion']!=null)?map['direccion']:'';
    this._fecha = DateTime.parse(map['fecha']);
    this._nombrePista = (map['nombrePista']!=null)?map['nombrePista']:'';
    this._hora = (map['hora']!=null)?map['hora']:'';
    this._precio = (map['precio']!=null)?map['precio']:'';
    this._jugadores = (map['jugadores']!=null)?map['jugadores']:'';
    this._idJ1 = (map['idJ1']!=null)?map['idJ1']:'';
    this._idJ2 = (map['idJ2']!=null)?map['idJ2']:'';
    this._idJ3 = (map['idJ3']!=null)?map['idJ3']:'';
    this._idJ4 = (map['idJ4']!=null)?map['idJ4']:'';
  }
  
  //Getters y setters 
  int? get id => _id;
  String get direccion => _direccion;
  DateTime get fecha => _fecha;
  String get nombrePista => _nombrePista;
  String get hora => _hora;
  int get precio => _precio;
  int get jugadores => _jugadores;
  int get idJ1 => _idJ1;
   int get idJ2 => _idJ2;
    int get idJ3 => _idJ3;
     int get idJ4 => _idJ4;
  

  set direccion(String direccion) {
    this._direccion = direccion;
  }
  set fecha(DateTime fecha) {
    this._fecha = fecha;
  }
  set nombrePista(String pista) {
    this._nombrePista = pista;
  }
  set hora(String hora) {
    this._hora = hora;
  }
  set precio(int precio) {
    this._precio = precio;
  }
  set jugadores (int numJugadores){
    this._jugadores = numJugadores;
  }
  set idJ1 (int idJ1){
    this._idJ1 = idJ1;
  }
  set idJ2 (int idJ2){
    this._idJ2 = idJ2;
  }
  set idJ3 (int idJ3){
    this._idJ3 = idJ3;
  }
  set idJ4 (int idJ4){
    this._idJ4 = idJ4;
  }
  
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null && id!=0) map['id'] = _id;
    map['direccion'] = _direccion;
    map['fecha'] = _fecha.toString();
    map['nombrePista'] = _nombrePista;
    map['hora'] = _hora;
    map['precio'] = _precio;
    map['jugadores']= _jugadores;
    map ['idJ1']= _idJ1;
    map ['idJ2']= _idJ2;
    map ['idJ3']= _idJ3;
    map ['idJ4']= _idJ4;
    return map;
  }


  // Obtener lista de pistas
  Future<List<Pista>> getPistas(bool modoLocal)async{
    List<Pista> listaPistas = []; // Inicializar lista vacía de pistas
    Pista pista = new Pista(); // objeto _nombrePista
    DateTime _fecha = DateTime.now();
    if(modoLocal){
      // codigo conexion base de datos con sqlite
      DBHelper dbHelper = DBHelper();
      List<Map<String, dynamic>> pistas = await dbHelper.consultarTabla("Pista");

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

