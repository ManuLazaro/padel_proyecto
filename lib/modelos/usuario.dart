import 'package:padel_proyecto/modelos/base_de_datos.dart';

class Usuario {
  int id = 0;
  String login = "";
  String nombre = "";
  String apellidos = "";
  DateTime fechaDeNacimiento = DateTime.now(); 
  String password = "";
  int rol = 0; // si es 0 es jugador, si es 1 es Gestor

  Usuario() {
    id = 0;
    login = "";
    nombre = "";
    apellidos = "";
    fechaDeNacimiento = DateTime.now(); // fecha actual
    password = "";
    rol = 0;
  }
  
  //constructor sin id
  Usuario.withoutId(this.login, this.nombre, this.apellidos, this.fechaDeNacimiento, this.password,this.rol);
  //constructor con id
  Usuario.withId(this.id, this.login, this.nombre, this.apellidos, this.fechaDeNacimiento, this.password,this.rol);
  //constructor con map
  Usuario.fromMap(Map<String, dynamic> map) {
    this.id = (map['id']!=null)?map['id']:null;
    this.login = (map['login']!=null)?map['login']:'';
    this.nombre = (map['nombre']!=null)?map['nombre']:'';
    this.apellidos = (map['apellidos']!=null)?map['apellidos']:'';
    this.fechaDeNacimiento = DateTime.parse(map['fechaDeNacimiento']);
    this.password = (map['password']!=null)?map['password']:'';
    this.rol = (map['rol']!=null)?map['rol']:'';
  }
  
  //Getters y setters 
  int? get _id => id;
  String get _login => login;
  String get _nombre => nombre;
  String get _apellidos => apellidos;
  DateTime get _fechaDeNacimiento => fechaDeNacimiento;
  String get _password => password;
  int get _rol => rol;

  set _login(String _login) {
    this.login = _login;
  }
  set _nombre(String _nombre) {
    this.nombre = _nombre;
  }
  set _apellidos(String _apellidos) {
    this.apellidos = _apellidos;
  }
  set _fechaDeNacimiento(DateTime _fechaDeNacimiento) {
    this.fechaDeNacimiento = _fechaDeNacimiento;
  }
  set _password(String _password) {
    this.password = _password;
  }
  set _rol(int _rol) {
    this.rol = _rol;
  }
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null && id!=0) map['id'] = _id;
    map['login'] = login;
    map['nombre'] = nombre;
    map['apellidos'] = apellidos;
    map['fechaDeNacimiento'] = fechaDeNacimiento.toString();
    map['password'] = password;
    map['rol'] = rol;
    return map;
  }

  Future<List<Usuario>> getUsuarios(bool modoLocal)async{
    List<Usuario> listaUsuarios = [];
    Usuario usuario = new Usuario();
    DateTime fechaDeNacimiento = DateTime.now();
    if(modoLocal){
      // codigo conexion base de datos ocn sqlite
      DBHelper dbHelper = DBHelper();
      List<Map<String, dynamic>> usuarios = await dbHelper.consultarTabla("usuarios");

      for(int i = 0; i< usuarios.length; i++){
        usuario = Usuario.fromMap(usuarios[i]);
        listaUsuarios.add(usuario);
      }
    }else{
      //codigo para la conexion con el API
    }
    return listaUsuarios;
  }
  
}
