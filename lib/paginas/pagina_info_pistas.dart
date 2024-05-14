import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:padel_proyecto/rutas/rutas.dart';
import 'package:padel_proyecto/widgets/cuadro_pistas.dart';
import 'package:padel_proyecto/widgets/menu_lateral.dart';
import 'package:padel_proyecto/widgets/barra_navegacion.dart';
class PaginasInfoPistas extends StatefulWidget {
  const PaginasInfoPistas({super.key});

  @override
  State<PaginasInfoPistas> createState() => _PaginasInfoPistasState();
}

class _PaginasInfoPistasState extends State<PaginasInfoPistas> {
  @override
  Widget build(BuildContext context) {
    String centro = 'Padel centro de valladolid';
    String lugar = 'Calle alguna de algo';
    String fecha = '12/12/2025';
    String hora = '12:00 - 13:00 ';

    String nombre = 'Pepito Algo Gonzalez';
    String nivel = 'Nivel amateur';
    int partidos = 23;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'INFORMACION DE LA PISTA', 
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
      drawer: menuLateral(), 
      body: ListView(
        children: [
          cuadroInformacionPista(),
          cuadroJugadores(nombre: nombre, nivel: nivel, partidos: partidos),     
        ],
        
      ),
      bottomNavigationBar: barraNavegacion(key: UniqueKey(),),
      backgroundColor: Color.fromARGB(255, 203, 216, 203),
    );
  }
}

