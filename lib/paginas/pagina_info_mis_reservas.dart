import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/cuadro_pistas.dart';
import '../widgets/menu_lateral.dart';

class PaginaInfoReservas extends StatefulWidget {
  const PaginaInfoReservas({super.key});

  @override
  State<PaginaInfoReservas> createState() => _PaginaInfoReservasState();
}

class _PaginaInfoReservasState extends State<PaginaInfoReservas> {
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
          'INFORMACION DE LA RESERVA', 
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: 140, vertical: 10), 
            child: ElevatedButton( 
                        onPressed: () {
                        },
                        style: ElevatedButton.styleFrom( 
                          backgroundColor: Color.fromARGB(255, 224, 19, 19), 
                          shape: RoundedRectangleBorder( 
                            borderRadius: BorderRadius.circular(5.0), 
                          ),
                        ),
                        child: SizedBox( 
                          child: Text(
                            'CANCELAR',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
             ),
          ),
        ],
        
      ),
      backgroundColor: Color.fromARGB(255, 203, 216, 203),
    );
  }
}

