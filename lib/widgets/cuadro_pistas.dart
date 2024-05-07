import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class cuadroPistas extends StatelessWidget {
  const cuadroPistas({
    Key? key,
    required this.centro,
    required this.lugar,
    required this.hora,
    required this.fecha,
    required this.ocupados,
  }) : super(key: key);

  final String centro;
  final String lugar;
  final String hora;
  final String fecha;
  final int ocupados;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // CONTENEDOR PARA EL COLOR DE FONDO
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0), 
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
            border: BorderDirectional( // borde de color solo en el lado derecho
              end: BorderSide(
                color:(ocupados!=4)? Colors.green:Colors.black,
                width: 5.0, 
              ),
            ),
          ),),
         // Raqueta de fondo
        Positioned(
          top: 30.0,
          right: 310.0,
          child: Opacity(
            opacity: 0.1,
            child: Icon(
              Icons.sports_tennis,
              size: 120.0,
              color: Colors.green,
            ),
          ),
        ),
        // CONTENEDOR CON LA LOGICA
        Container(
          padding: EdgeInsets.all(6.0), // Sirve para dar espacio por dentro 
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0), 
          height: 110,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(5.0), // Bordes redondos
            border: BorderDirectional( // borde de color solo en el lado derecho
              end: BorderSide(
                color:(ocupados!=4)? Colors.green:Colors.black,
                width: 5.0, 
              ),
            ),
          ),
          child: Row(   
            children: [
              Expanded(
                child: StreamBuilder<Object>(
                  stream: null,
                  builder: (context, snapshot) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center, // lo coloca en el centro
                      children: [
                        Text(centro),
                        Text(lugar),
                        SizedBox(height: 30),
                        Text(hora),
                      ],
                    );
                  }
                ),
              ),
              SizedBox(width: 20),
              Text(fecha),
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
                child: _huecosDisponibles(ocupados: ocupados)),
                
                      ],
                    ),
        ),
      
      ],
    );
  }
}



/////////////////////////////////////////////////////
// Cuadro con los Circulos marcados o no marcados  //
////////////////////////////////////////////////////
class _huecosDisponibles extends StatelessWidget {
  const _huecosDisponibles({
    super.key,
    required this.ocupados,
  });
  final int ocupados;
  @override
  Widget build(BuildContext context) {
    return Column( // usar una columna para centrarlo mas facil
        mainAxisAlignment: MainAxisAlignment.center, // Centrar los círculos verticalmente
        children: [
          Row(
            children: [
              (ocupados>0)? const _circuloMarcado():const _circuloNoMarcado(),
               const SizedBox(width: 10),
              (ocupados>1)?const _circuloMarcado():const _circuloNoMarcado(),
            ],
          ),
           const SizedBox(height: 25),
          Row(
            children: [
              (ocupados>2)?const _circuloMarcado():const _circuloNoMarcado(),
             const SizedBox(width: 10),
              (ocupados>3)?const _circuloMarcado():const _circuloNoMarcado(),
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
//////////////////////////////
// Cuadro para historial   //
/////////////////////////////
class cuadroPistasHistorial extends StatelessWidget {
  const cuadroPistasHistorial({
    Key? key,
    required this.centro,
    required this.lugar,
    required this.hora,
    required this.fecha,
    required this.ocupados,
  }) : super(key: key);

  final String centro;
  final String lugar;
  final String hora;
  final String fecha;
  final int ocupados;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // CONTENEDOR PARA EL COLOR DE FONDO
        _fondoHistorial(ocupados: ocupados),
         // Raqueta de fondo
       
        // CONTENEDOR CON LA LOGICA
        Container(
          padding: EdgeInsets.all(6.0), // Sirve para dar espacio por dentro 
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0), 
          height: 110,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(5.0), // Bordes redondos
            border: BorderDirectional( // borde de color solo en el lado derecho
              end: BorderSide(
                color:(ocupados!=4)? Colors.green:Color.fromARGB(255, 255, 0, 0),
                width: 5.0, 
              ),
            ),
          ),
          child: Row(   
            children: [
              Expanded(
                child: StreamBuilder<Object>(
                  stream: null,
                  builder: (context, snapshot) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center, // lo coloca en el centro
                      children: [
                        Text(centro),
                        Text(lugar),
                        SizedBox(height: 10),
                        Text(hora),
                      ],
                    );
                  }
                ),
              ),
              SizedBox(width: 20),
              Text(fecha),
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
                child: _huecosDisponibles(ocupados: ocupados)),
                
                      ],
                    ),
        ),
      
      ],
    );
  }
}

class _fondoHistorial extends StatelessWidget {
  const _fondoHistorial({
    super.key,
    required this.ocupados,
  });

  final int ocupados;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0), 
      height: 110,
      width: double.infinity,
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
        border: BorderDirectional( // borde de color solo en el lado derecho
          end: BorderSide(
            color:(ocupados!=4)? Colors.green:Colors.black,
            width: 5.0, 
          ),
        ),
        gradient: LinearGradient( // Degradado de color rojo
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 255, 255, 255),
            Colors.red.withOpacity(0.6), 
          ],
        )
      ),
      child: Stack(
        children: [
          Positioned(
            right: 290,
            top: 10,
            child: Icon(
              Icons.sports_tennis,
              size: 120.0,
              color: Colors.green.withOpacity(0.15),
            ),
          ),
        ],
      ),
    );
  }
}
class _fondo extends StatelessWidget {
  const _fondo({
    super.key,
    required this.ocupados,
  });

  final int ocupados;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0), 
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
        border: BorderDirectional( // borde de color solo en el lado derecho
          end: BorderSide(
            color:(ocupados!=4)? Colors.green:Colors.black,
            width: 5.0, 
          ),
        ),
        gradient: LinearGradient( // Degradado de color rojo
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 255, 255, 255),
            Colors.red.withOpacity(0.6), 
          ],
        )
      ),
    );
  }
}



//////////////////////////////
// Cuadro para jugadores   //
/////////////////////////////
class cuadroJugadores extends StatelessWidget {
  const cuadroJugadores({
    Key? key,
    required this.nombre,
    required this.nivel,
    required this.partidos,
  }) : super(key: key);
  final String nombre;
  final String nivel;
  final int partidos;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // CONTENEDOR PARA EL COLOR DE FONDO
        Container(
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 4.0), 
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
          ),
        ),
         // Raqueta de fondo
        Positioned(
          top: 0.0,
          right: 310.0,
          child: Opacity(
            opacity: 0.1,
            child: Icon(
              Icons.sports_tennis,
              size: 120.0,
              color: Colors.green,
            ),
          ),
        ),
        // CONTENEDOR CON LA LOGICA
        Container(
          padding: EdgeInsets.all(6.0), // Sirve para dar espacio por dentro 
          margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), 
          height: 110,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(5.0), // Bordes redondos
          ),
          child: Row(   
            children: [
              Expanded(
                child: StreamBuilder<Object>(
                  stream: null,
                  builder: (context, snapshot) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center, // lo coloca en el centro
                      children: [
                        Text(nombre),
                        SizedBox(height: 10),
                        Text(nivel),
                        SizedBox(height: 10),
                        Text('${partidos.toString()} partidos jugados'), // juntar la varibale con el texto que aparecera a su lado
                  
                      ],
                    );
                  }
                ),
              ),        
              SizedBox(width: 130),
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
                child:  Icon(Icons.person_sharp, size: 75.0), 
                ),
              ],
             ),
        ),
      
      ],
    );
  }
}