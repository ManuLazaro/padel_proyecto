import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:padel_proyecto/rutas/rutas.dart';
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
      body: Stack(
        children: [
          //_cuadroPistas(),
          _cuadroInformacionPista(),
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

class _cuadroInformacionPista extends StatelessWidget {
  const _cuadroInformacionPista({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: EdgeInsets.all(6.0), // Sirve para dar espacio por dentro 
    margin: EdgeInsets.symmetric(vertical: 35.0, horizontal: 4.0), 
    height: 110,
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.circular(5.0), // Bordes redondos
      boxShadow: const [
        BoxShadow(
          color: Color.fromARGB(255, 108, 114, 108), 
          blurRadius: 2.0, 
          offset: Offset(1, 2), // Sombra por un lado y por abajo
        ),
      ],
      border: const BorderDirectional( // borde solo en el lado derecho
        end: BorderSide(
          color: Colors.green,
          width: 5.0, 
        ),
      ),
    ),
        child: const Column(
          children: [
            SizedBox(height: 10),
            Row( // fila 1
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('30/12/2024'),
                      SizedBox(width: 20),
                      Text('12:00 - 13:00 '),
                      SizedBox(width: 20),
                      Text('Centro de Padel Valladolid'),
                      
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Padding(// Fila 3 en un padding para poner margen a la izquierda
              padding: EdgeInsets.only(left: 23), 
              child: Row( // fila 2
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.person, size: 35, color: Color.fromARGB(255, 77, 185, 69)),
                  SizedBox(width: 10),
                  Icon(Icons.person, size: 35, color: Color.fromARGB(255, 58, 49, 49),),
                  SizedBox(width: 50),
                  Text('Nivel amateur'),
                ],
              ),
            ),
            Padding( // Fila 3 en un padding para poner margen a la izquierda
              padding: EdgeInsets.only(left: 35), 
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('2  '),
                  SizedBox(width: 20),
                  Text('   2'),
                ],
              ),
            ),
          ],
        ),
    
    
      );
  }
}






class _cuadroPistas extends StatelessWidget {
  const _cuadroPistas({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
  padding: EdgeInsets.all(6.0), // Sirve para dar espacio por dentro 
  margin: EdgeInsets.symmetric(vertical: 35.0, horizontal: 4.0), 
  height: 110,
  decoration: BoxDecoration(
    color: Color.fromARGB(255, 255, 255, 255),
    borderRadius: BorderRadius.circular(5.0), // Bordes redondos
    boxShadow: const [
      BoxShadow(
        color: Color.fromARGB(255, 108, 114, 108), 
        blurRadius: 2.0, 
        offset: Offset(1, 2), // Sombra por un lado y por abajo
      ),
    ],
    border: const BorderDirectional( // borde solo en el lado derecho
      end: BorderSide(
        color: Colors.green,
        width: 5.0, 
      ),
    ),
  ),
      child: Row(   
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, // lo coloca en el centro
              children: [
                Text('Centro de Padel Valladolid'),
                Text('Calle del padel 44'),
                SizedBox(height: 30),
                Text('11:00 - 12:00 AM'),
              ],
            ),
          ),
          SizedBox(width: 20),
          Text('30/12/2025'),
          SizedBox(width: 20),
          Container(
            width: 1,
             margin: EdgeInsets.only(right: 8.0),
            decoration: BoxDecoration(
              color: Colors.black
            ),
          ),
          SizedBox(width: 9),
          Container(
            margin: EdgeInsets.only(right: 8.0), // Margen agregado solo en la parte izquierda
            child: _huecosDisponibles()),
            
        ],
      ),
    );
  }
}

class _huecosDisponibles extends StatelessWidget {
  const _huecosDisponibles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column( // usar una columna para centrarlo mas facil
        mainAxisAlignment: MainAxisAlignment.center, // Centrar los círculos verticalmente
        children: [
          Row(
            children: [
              _circuloMarcado(),
               SizedBox(width: 10),
              _circuloMarcado()
            ],
          ),
           SizedBox(height: 25),
          Row(
            children: [
              _circuloNoMarcado(),
              SizedBox(width: 10),
              _circuloNoMarcado()
            ],
          ),
        ],
      );
  }
}


class _circuloMarcado extends StatelessWidget {
  const _circuloMarcado({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30, 
      height: 30, 
      decoration: BoxDecoration(
        shape: BoxShape.circle, // forma de circulo
        color: const Color.fromARGB(255, 77, 185, 69),
        border: Border.all(  // borde del circlo
          color: Colors.black,
          width: 1,
        ),
      ),
      child: CircleAvatar( // ICONO DENTRO DEL CIRCULO
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        child: Icon(
          Icons.person,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}

class _circuloNoMarcado extends StatelessWidget {
  const _circuloNoMarcado({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30, 
      height: 30, 
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromARGB(255, 85, 81, 81), 
        border: Border.all( 
          color: Colors.black,
          width: 1,
        ),
      ),
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Icon(
          Icons.person,
          color: Colors.white, 
          size: 20, 
        ),
      ),
    );
  }
}


