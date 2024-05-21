import 'package:sqflite/sqflite.dart';

class DBHelper{
  static Database? _baseDatos;
  static const String _nombreFicheroBD = "padel.db";



  // inicio base de datos
  Future <Database?> get baseDatos async{
    if(_baseDatos != null){
      return _baseDatos;
    }
      _baseDatos = await _inicializarBD();
      return _baseDatos;
    
  }
  Future<List<Map<String, dynamic>>> consultarTabla(String tabla) async{
    Database? db = await baseDatos;
    var resultado = await db!.query(tabla);
    return resultado;
  }
  Future<int> insertarTabla(String tabla,Map<String, dynamic> fila)async{
    Database? db = await baseDatos;
    var resultado = await db!.insert(tabla, fila);
    return resultado;
  }


  _inicializarBD() async{
    var directorio = await getDatabasesPath();
    String path = directorio+_nombreFicheroBD;
    var baseDatos = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async { 
        await db.execute('CREATE TABLE if not exists Usuario(id INTEGER PRIMARY KEY, login text, nombre text, apellidos text, fechaDeNacimiento text, password text, rol INTEGER)');
      }
    );
    return baseDatos;
  }




}