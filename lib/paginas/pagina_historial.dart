import 'package:flutter/material.dart';

import '../widgets/barra_navegacion.dart';
import '../widgets/cuadro_pistas.dart';
import '../widgets/menu_lateral.dart';

class PaginaPistasHistorial extends StatefulWidget {
  const PaginaPistasHistorial({super.key});

  @override
  State<PaginaPistasHistorial> createState() => _PaginaPistasHistorialState();
}


class _PaginaPistasHistorialState extends State<PaginaPistasHistorial> {
  @override
  Widget build(BuildContext context) {
    String centro = 'Padel centro de valladolid';
    String lugar = 'Calle alguna de algo';
    String fecha = '12/12/2025';
    String hora = '12:00 - 13:00 ';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HISTORIAL', 
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
          Container(  
            padding: EdgeInsets.only(top: 6.0,left: 370.0), 
            child: SizedBox( 
              width: 22.0, 
              height: 22.0, 
              child: FloatingActionButton( // boton flotante pequeño
                onPressed: () {
                },
                child: Icon(Icons.swap_vert, size: 20,), 
                backgroundColor: Color.fromARGB(255, 77, 185, 69), 
                shape: CircleBorder(), // Forma de circulo
  
              ),
            ),
          ),
          cuadroPistasHistorial(centro: centro, lugar: lugar, hora: hora, fecha: fecha, ocupados: 4,),
        ],
      ),
      floatingActionButton: FloatingActionButton( // boton flotante grande
        onPressed: () {
        },
        child: Icon(Icons.add), 
        backgroundColor: Color.fromARGB(255, 77, 185, 69), 
      ),
      bottomNavigationBar: barraNavegacion(),
      backgroundColor: Color.fromARGB(255, 203, 216, 203),
    );
  }
}

