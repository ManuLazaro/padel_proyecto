import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/boton_largo.dart';

class PaginaCrearJugador extends StatefulWidget {
  const PaginaCrearJugador({super.key});

  @override
  State<PaginaCrearJugador> createState() => _PaginaCrearJugadorState();
}

class _PaginaCrearJugadorState extends State<PaginaCrearJugador> {
   @override
  Widget build(BuildContext context) {
    String botonInicio = 'Iniciar sesion';
    Color colorVerde = Color.fromARGB(255, 29, 88, 29);
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(),
            SizedBox(height: 20.0),
            TextField(),
            SizedBox(height: 20.0),
            TextField(),
            SizedBox(height: 20.0),
            TextField(),
            SizedBox(height: 20.0),
            TextField(obscureText: true),
            SizedBox(height: 20.0),
            TextField(obscureText: true),
            botonLargo(nombre: botonInicio, color: colorVerde,),
          ],
        ),
      ),
    );
  }
}
