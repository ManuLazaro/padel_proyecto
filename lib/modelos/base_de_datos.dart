import 'package:sqflite/sqflite.dart';

class DBHelper{
  static Database? _baseDatos;
  static const String _nombreFicheroBD = "padel.db";


  // INCIAR BASE DE DATOS
  // la "?" es que puede devolver un null o una base de datos
  // Future y async: funcion asincrona 
  Future <Database?> get baseDatos async{ 
    if(_baseDatos != null){ // si la BD ya esta creada
      return _baseDatos; // se devuelve la base de datos
    } // si no esta creada 
      _baseDatos = await _inicializarBD(); //primero se inicializa la BD
      return _baseDatos;// Y luego se devuelve la BD
  }
  

  // CONSULTAR TABLA 
  // Una lista de mapas con datos de la tabla que se le pase
  Future<List<Map<String, dynamic>>> consultarTabla(String tabla) async{
    Database? db = await baseDatos; // Crear BD que recibira mas tarde una base de datos
    var resultado = await db!.query(tabla);//consultar la tabla que se le pase
    return resultado; // devolver el resultado de la query
  }

  // INSERTAR EN TABLA
  // devuelve un int (el 'id' basicamente)
  Future<int> insertarTabla(String tabla,Map<String, dynamic> fila)async{
    Database? db = await baseDatos;
    // Inserta una fila en la tabla que se le pase 
    var resultado = await db!.insert(tabla, fila);
    return resultado;
  }

  // INICIALIZACION DE LA BASE DE DATOS
  _inicializarBD() async{

    var directorio = await getDatabasesPath(); // Obtener la ruta 
    String path = directorio+_nombreFicheroBD; // Contruir la ruta con el directorio y el nombre de la BD
    var baseDatos = await openDatabase( // crear la base de datos en la ruta pasada
      path, // ruta
      version: 1, // version
      onCreate: (Database db, int version) async {  // query de creacion
        await db.execute(
          'CREATE TABLE if not exists Usuario(id INTEGER PRIMARY KEY, login text, nombre text, apellidos text, fechaDeNacimiento text, password text, rol INTEGER)'
          );
          //para añadir una segunda tabla
         await db.execute(
           "CREATE TABLE  IF NOT EXISTS Pistas (id INTEGER PRIMARY KEY, direccion TEXT, fecha text, pista TEXT, hora TEXT, precio INTEGER)"
         );
         
      }
    );
    return baseDatos; // devolver la base de datos creada
  }
}