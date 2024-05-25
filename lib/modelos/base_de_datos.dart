import 'package:padel_proyecto/modelos/jugador.dart';
import 'package:sqflite/sqflite.dart';

import 'usuario.dart';

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

  // insertar n jugador pasando un parametro
  Future<int> insertarJugador(Jugador jugador) async {
  Database? db = await baseDatos;
  var resultado = await db!.insert('Jugador', jugador.toMap());
  return resultado;
}
 // actualizar la pista 
  Future<void> actualizarPista(int pistaId, int nuevosJugadores) async {
    Database? db = await baseDatos;
    await db!.rawUpdate(
      'UPDATE Pista SET jugadores = ? WHERE id = ?',
      [nuevosJugadores, pistaId],
    );
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
           "CREATE TABLE  IF NOT EXISTS Pista (id INTEGER PRIMARY KEY,centroDeportivo TEXT, direccion TEXT, fecha text, nombrePista TEXT, hora TEXT, precio INTEGER, jugadores INTEGER, idJ1 INTEGER, idJ2 INTEGER, idJ3 INTEGER, idJ4 INTEGER)"
         );
        // para añadir una TERCERA tabla
         await db.execute(
          "CREATE TABLE IF NOT EXISTS Jugador (idJugador INTEGER PRIMARY KEY, nivel TEXT, codigoPostal INTEGER, telefono TEXT, usuarioId INTEGER)"
        );
      },
      readOnly: false, // La 3 tabla se crea como solo lectura asi que pongo esto para que no pase eso
    );
    return baseDatos; // devolver la base de datos creada
  }

// AUTENTIFICAR SI EL USUARIO EXISTE EN  LA BASE DE DATOS
  Future<Usuario?> autenticar(String tabla, String login, String password) async { // PUEDE SER NULO
  Database? db = await baseDatos;
  List<Map<String, dynamic>> resultado = await db!.query(
    tabla,
    where: 'login = ? AND password = ?',
    whereArgs: [login, password],
  );
  if (resultado.isNotEmpty) {
    return Usuario.fromMap(resultado.first);
  }
  return null;
}
  // OBTENER ID 
 Future<int?> obtenerId(String tabla, String campo, dynamic valor) async {
  Database? db = await baseDatos;
  List<Map<String, dynamic>> resultado = await db!.query(
    tabla,
    where: '$campo = ?',
    whereArgs: [valor],
  );
  if (resultado.isNotEmpty) {
    return resultado.first['id'] as int?;
  }
  return null;
}
}