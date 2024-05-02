import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:padel_proyecto/rutas/rutas.dart';
import 'package:padel_proyecto/widgets/cuadro_pistas.dart';
import 'package:padel_proyecto/widgets/menu_lateral.dart';
import 'package:padel_proyecto/widgets/barra_navegacion.dart';
class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  @override
  Widget build(BuildContext context) {
    String centro = 'Padel centro de valladolid';
    String lugar = 'Calle alguna de algo';
    String fecha = '12/12/2025';
    String hora = '12:00 - 13:00 ';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PADEL', 
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
          cuadroPistas(centro: centro, lugar: lugar, hora: hora, fecha: fecha, ocupados: 4,),
          //_cuadroPistas(),
         cuadroInformacionPista(),
          Positioned( // Posicion del boton de arriba a la derecha
            top: 6.0, 
            right: 10.0, 
            child: SizedBox( // envuelto en una caja para darle tamaño
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

