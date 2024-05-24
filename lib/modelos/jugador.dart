import 'package:padel_proyecto/modelos/base_de_datos.dart';
import 'package:padel_proyecto/modelos/usuario.dart';

class Jugador extends Usuario {
  
  String nivel="";
  int codigoPostal=0;
  String telefono="";
  late int usuarioId; //El id de usuario para poder pasarlo luego con el provider
   

  //constructor
  Jugador() {
    this.id = 0;
    this.nivel = '';
    this.codigoPostal = 0;
    this.telefono = '';
  }
  //constructor sin id
  Jugador.withoutId(this.usuarioId, this.nivel, this.codigoPostal, this.telefono);
 
  //constructor con map
  Jugador.fromMap(Map<String, dynamic> map) {
    this.id = (map['id']!=null)?map['id']:null;
    this.usuarioId = (map['usuarioId'] != null) ? map['usuarioId'] : null;
    this.nivel = (map['nivel']!=null)?map['nivel']:'';
    this.codigoPostal = (map['codigoPostal']!=null)?map['codigoPostal']:'';
    this.telefono = (map['telefono']!=null)?map['telefono']:'';
  }
  
  //Getters y setters 
  int? get _id => id;
  String get _nivel => nivel;
  int get _codigoPostal => codigoPostal;
  String get _telefono => telefono;
  
  set _nivel(String _nivel) {
    this.nivel = _nivel;
  }
  set _codigoPostal(int _codigoPostal) {
    this.codigoPostal = _codigoPostal;
  }
  set _telefono(String _telefono) {
    this.telefono = _telefono;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null) map['id'] = _id;
    map['usuarioId'] = usuarioId;
    map['nivel'] = nivel;
    map['codigoPostal'] = codigoPostal;
    map['telefono'] = telefono;
    return map;
  }
// Obtener lista de pistas
  Future<List<Jugador>> getJugadores(bool modoLocal)async{
    List<Jugador> listaJugadores = []; // Inicializar lista vacía de pistas
    Jugador jugador = new Jugador(); 
    if(modoLocal){
      // codigo conexion base de datos con sqlite
      DBHelper dbHelper = DBHelper();
      List<Map<String, dynamic>> jugadores = await dbHelper.consultarTabla("Jugador");

      for(int i = 0; i< jugadores.length; i++){
        jugador= Jugador.fromMap(jugadores[i]);
        listaJugadores.add(jugador);
      }
    }else{
      //codigo para la conexion con el API
    }
    return listaJugadores;
  }
}


