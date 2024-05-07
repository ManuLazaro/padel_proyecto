import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:padel_proyecto/main.dart';
import 'package:padel_proyecto/rutas/rutas.dart';
import 'package:padel_proyecto/widgets/menu_lateral.dart';
import 'package:padel_proyecto/widgets/barra_navegacion.dart';

import '../widgets/boton_largo.dart';
import '../widgets/logo.dart';
import '../widgets/text_field.dart';
class PaginaCrearGestor extends StatefulWidget {
  const PaginaCrearGestor({super.key});

  @override
  State<PaginaCrearGestor> createState() => _PaginaCrearGestorState();
}

class _PaginaCrearGestorState extends State<PaginaCrearGestor> {
  
  String botonRegistro = 'Registrarse ahora';
  Color colorVerde = Color.fromARGB(255, 29, 88, 29);
   String texto= "";
   
  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        'DATOS DEL GESTOR', 
        style: TextStyle(
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 77, 185, 69),
        ),
      ),
    ),
    body: Container(
      color: Color.fromARGB(255, 77, 185, 69),
      padding: EdgeInsets.all(20.0),
      child: Column(
 
        children: [
          SizedBox(
            height: 575.0, // PAra la altura del ListView
            child: ListView(
              children: [
                PistaPadel(),
                SizedBox(height: 30.0),
                textField( texto: 'Usuario',),
                SizedBox(height: 20.0),
                textField( texto: 'Nombre',),
                SizedBox(height: 20.0),
                textField( texto: 'Apellidos',),
                SizedBox(height: 20.0),
                textField( texto: 'Fecha de nacimiento',),
                SizedBox(height: 20.0),
                textField( texto: 'Nombre del Centro Deportivo',),
                SizedBox(height: 20.0),
                textField( texto: 'Numero de pistas',),
                SizedBox(height: 20.0),
                textField( texto: 'Contraseña',ocultarTexto: true),
                SizedBox(height: 20.0),
                textField( texto: 'Repetir Contraseña',ocultarTexto: true),
              ],
            ),
          ),
          SizedBox(height: 10.0), // Espacio entre la ListView y el botón
          botonLargo(nombre: botonRegistro, color: colorVerde,), // Botón fuera de la ListView
        ],
      ),
    ),
  );
}
}