class Pista {

  int id = 0;
  String direccion="";
  String fecha="";
  String pista="";
  String hora="";
  int precio=0;
  

    Pista() {
    id = 0;
    direccion = "";
    fecha = "";
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
    this.fecha = (map['fecha']!=null)?map['fecha']:'';
    this.pista = (map['pista']!=null)?map['pista']:'';
    this.hora = (map['hora']!=null)?map['hora']:'';
    this.precio = (map['precio']!=null)?map['precio']:'';
  }
  
  //Getters y setters 
  int? get _id => id;
  String get _direccion => direccion;
  String get _fecha => fecha;
  String get _pista => pista;
  String get _hora => hora;
  int get _precio => precio;
  

  set _direccion(String _direccion) {
    this.direccion = _direccion;
  }
  set _fecha(String _fecha) {
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
    map['fecha'] = fecha;
    map['pista'] = pista;
    map['hora'] = hora;
    map['precio'] = precio;
    return map;
  }
}

