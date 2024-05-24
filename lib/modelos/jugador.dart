import 'package:padel_proyecto/modelos/base_de_datos.dart';
import 'package:padel_proyecto/modelos/usuario.dart';

class Jugador extends Usuario {
  
  late int _idJugador; 
  String _nivel="";
  int _codigoPostal=0;
  String _telefono="";
  late int _usuarioId; //El id de usuario para poder pasarlo luego con el provider
   

  // Constructor
Jugador(int usuarioId) {
  this._idJugador = 0;
  this._nivel = '';
  this._codigoPostal = 0;
  this._telefono = '';
  this._usuarioId = id;
}
 

  //constructor sin id
  Jugador.withoutId(this._nivel, this._codigoPostal, this._telefono, this._usuarioId);
  //constructor con id
  Jugador.withId(this._idJugador, this._nivel, this._codigoPostal, this._telefono, this._usuarioId);
  // Constructor con map
  Jugador.fromMap(Map<String, dynamic> map) {
    this._idJugador = (map['idJugador'] != null) ? map['idJugador'] : null;
    this._nivel = (map['nivel'] != null) ? map['nivel'] : '';
    this._codigoPostal = (map['codigoPostal'] != null) ? map['codigoPostal'] : 0;
    this._telefono = (map['telefono'] != null) ? map['telefono'] : '';
    this._usuarioId = (map['usuarioId'] != null) ? map['usuarioId'] : null;
  }
  
  // Getters y setters 
  int? get idJugador => _idJugador;
  String get nivel => _nivel;
  int get codigoPostal => _codigoPostal;
  String get telefono => _telefono;
  int get usuarioId => _usuarioId;
  
  set nivel(String nivel) {
    this._nivel = nivel;
  }

  set codigoPostal(int codigoPostal) {
    this._codigoPostal = codigoPostal;
  }

  set telefono(String telefono) {
    this._telefono = telefono;
  }

  set usuarioId(int usuarioId) {
    this._usuarioId = usuarioId;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_idJugador != null) map['idJugador'] = _idJugador;
    map['nivel'] = _nivel;
    map['codigoPostal'] = _codigoPostal;
    map['telefono'] = _telefono;
    map['usuarioId'] = _usuarioId;
    return map;
  }

  // Obtener lista de jugadores
Future<List<Jugador>> getJugadores(bool modoLocal) async {
  List<Jugador> listaJugadores = []; // Inicializar lista vacía de jugadores
  if (modoLocal) {
    DBHelper dbHelper = DBHelper();
    List<Map<String, dynamic>> jugadores = await dbHelper.consultarTabla("Jugador");

    for (int i = 0; i < jugadores.length; i++) {
      // Crear una nueva instancia de Jugador usando el constructor withId
      Jugador jugador = Jugador.withId(
        jugadores[i]['id'],
        jugadores[i]['nivel'],
        jugadores[i]['codigoPostal'],
        jugadores[i]['telefono'],
        jugadores[i]['usuarioId'],
      );
      listaJugadores.add(jugador);
    }
  } else {
    // Código para la conexión con el API
  }
  return listaJugadores;
}

}