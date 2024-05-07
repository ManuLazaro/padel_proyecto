import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/boton_largo.dart';
import '../widgets/logo.dart';
import '../widgets/text_field.dart';

class PaginaCrearJugador extends StatefulWidget {
  const PaginaCrearJugador({super.key});

  @override
  State<PaginaCrearJugador> createState() => _PaginaCrearJugadorState();
}

class _PaginaCrearJugadorState extends State<PaginaCrearJugador> {
   
  String botonRegistro = 'Registrarse ahora';
  Color colorVerde = Color.fromARGB(255, 29, 88, 29);
   String texto= "";
   
  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        'DATOS DEL JUGADOR', 
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
      child: ListView( // PRIMER LISTVIEW CON EL BOTON
        children: [
          SizedBox(
            height: 575.0, // PAra la altura del ListView
            child: ListView( // SEGUNDO LISTVIEW CON LOS TEXTFIELD
              children: [
                PistaPadel(),
                SizedBox(height: 30.0),
                textField(texto, texto: 'Usuario',),
                SizedBox(height: 20.0),
                textField(texto, texto: 'Nombre',),
                SizedBox(height: 20.0),
                textField(texto, texto: 'Apellidos',),
                SizedBox(height: 20.0),
                textField(texto, texto: 'Fecha de nacimiento',),
                SizedBox(height: 20.0),
                textField(texto, texto: 'Nivel',),
                SizedBox(height: 20.0),
                textField(texto, texto: 'Contraseña',ocultarTexto: true),
                SizedBox(height: 20.0),
                textField(texto, texto: 'Repetir Contraseña',ocultarTexto: true),
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