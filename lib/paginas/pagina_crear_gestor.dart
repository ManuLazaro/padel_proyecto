import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:padel_proyecto/rutas/rutas.dart';
import 'package:padel_proyecto/widgets/menu_lateral.dart';
import 'package:padel_proyecto/widgets/barra_navegacion.dart';

import '../widgets/boton_largo.dart';
class PaginaCrearGestor extends StatefulWidget {
  const PaginaCrearGestor({super.key});

  @override
  State<PaginaCrearGestor> createState() => _PaginaCrearGestorState();
}

class _PaginaCrearGestorState extends State<PaginaCrearGestor> {
  String botonRegistro = 'Registrarse ahora';
  Color colorVerde = Color.fromARGB(255, 29, 88, 29);
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
            botonLargo(nombre: botonRegistro,color: colorVerde,),
          ],
        ),
      ),
    );
  }
}
