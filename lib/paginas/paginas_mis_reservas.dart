import 'package:flutter/material.dart';

import '../widgets/barra_navegacion.dart';
import '../widgets/cuadro_pistas.dart';
import '../widgets/menu_lateral.dart';

class PaginasMisReservas extends StatefulWidget {
  const PaginasMisReservas({super.key});

  @override
  State<PaginasMisReservas> createState() => _PaginasMisReservasState();
}


class _PaginasMisReservasState extends State<PaginasMisReservas> {
  @override
  Widget build(BuildContext context) {
    String centro = 'Padel centro de valladolid';
    String lugar = 'Calle alguna de algo';
    String fecha = '12/12/2025';
    String hora = '12:00 - 13:00 ';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MIS RESERVAS', 
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
          Stack(
            children: [ /////// BOTONES DE ARRIBA PARA ORDENAR////
              Padding(
                padding: const EdgeInsets.only(left: 70.0),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                      },
                      child: Text('Fecha', style: TextStyle(fontSize: 15, color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 77, 185, 69), 
                        shape: RoundedRectangleBorder(),// forma rectangulo                  
                        minimumSize: Size(60, 30), 
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                      },
                      child: Text('Nivel', style: TextStyle(fontSize: 15, color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 77, 185, 69), 
                        shape: RoundedRectangleBorder(),// forma rectangulo                  
                        minimumSize: Size(60, 30), 
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                      },
                      child: Text('Huecos', style: TextStyle(fontSize: 15, color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 77, 185, 69), 
                        shape: RoundedRectangleBorder(),// forma rectangulo                  
                        minimumSize: Size(60, 30), 
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 44,
                bottom: 8.5,
                child: Container( // Botón flotante pequeño
                  width: 30, 
                  height: 30, 
                  child: Icon(Icons.swap_vert, size: 18, color: Colors.white,), 
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle, 
                    color: Colors.green, 
                  ),
                ),
              ),
            ],
          ),
          // CUADRO DE LAS PISTAS
          cuadroPistas(centro: centro, lugar: lugar, hora: hora, fecha: fecha, ocupados: 4,),
          // BOTON AÑADIR
          Container(
            margin: EdgeInsets.symmetric(horizontal: 100, vertical: 10), 
            child: ElevatedButton( 
                        onPressed: () {
                        },
                        style: ElevatedButton.styleFrom( 
                          backgroundColor: Color.fromARGB(255, 77, 185, 69), 
                          shape: RoundedRectangleBorder( 
                            borderRadius: BorderRadius.circular(5.0), 
                          ),
                        ),
                        child: SizedBox( 
                          child: Text(
                            'AÑADIR  RESERVAS',
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
      floatingActionButton: FloatingActionButton( // boton flotante grande
        onPressed: () {
        },
        child: Icon(Icons.add), 
        backgroundColor: Color.fromARGB(255, 77, 185, 69), 
      ),
      bottomNavigationBar: BarraNavegacion(key: UniqueKey(),selectedIndex: 1,),
      backgroundColor: Color.fromARGB(255, 203, 216, 203),
    );
  }
}

