class Jugador {
  int id = 0;
  String nivel="";
  int codigoPostal=0;
  String telefono="";

  
  //constructor
  Jugador() {
    this.id = 0;
    this.nivel = '';
    this.codigoPostal = 0;
    this.telefono = '';
  }
  //constructor sin id
  Jugador.withoutId(this.nivel, this.codigoPostal, this.telefono);
  //constructor con id
  Jugador.withId(this.id, this.nivel, this.codigoPostal, this.telefono);
  //constructor con map
  Jugador.fromMap(Map<String, dynamic> map) {
    this.id = (map['id']!=null)?map['id']:null;
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
    map['nivel'] = nivel;
    map['codigoPostal'] = codigoPostal;
    map['telefono'] = telefono;
    return map;
  }
}


