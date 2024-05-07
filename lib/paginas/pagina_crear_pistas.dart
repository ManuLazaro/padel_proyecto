import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:padel_proyecto/modelos/pista_nueva.dart';

import '../widgets/barra_navegacion.dart';
import '../widgets/boton_largo.dart';
import '../widgets/logo.dart';
import '../widgets/text_field.dart';

class PaginaCrearPistas extends StatefulWidget {
  const PaginaCrearPistas({super.key});

  @override
  State<PaginaCrearPistas> createState() => _PaginaCrearPistasState();
}

class _PaginaCrearPistasState extends State<PaginaCrearPistas> {
   
  String botonRegistro = 'Crear pista';
  Color colorVerde = Color.fromARGB(255, 29, 88, 29);
  String texto= "";

  PistaNueva crearPista = new PistaNueva();

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        'Añadir  pista', 
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
                textField(texto, texto: 'Direccion',),
                SizedBox(height: 20.0),
                textField(texto, texto: 'Fecha',),
                SizedBox(height: 20.0),
                textField(texto, texto: 'Hora',),
                SizedBox(height: 20.0),
                textField(texto, texto: 'Pista',),
                SizedBox(height: 20.0),
                textField(texto, texto: 'Precio por persona',),
              ],
            ),
          ),
          SizedBox(height: 10.0), // Espacio entre la ListView y el botón
          botonLargo(nombre: botonRegistro, color: colorVerde,), // Botón fuera de la ListView
        ],
      ),
    ),
  //  bottomNavigationBar: barraNavegacion(),
  );
}
}