import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:padel_proyecto/modelos/pista.dart';

import 'package:padel_proyecto/paginas/pagina_info_mis_reservas.dart';
import 'package:padel_proyecto/paginas/pagina_info_pistas.dart';
import 'package:padel_proyecto/widgets/ThemeApp.dart';
import 'package:provider/provider.dart';

import '../provider/datos_usuario.dart';


class cuadroPistas extends StatelessWidget {
  const cuadroPistas({
    Key? key,
    required this.centro,
    required this.lugar,
    required this.hora,
    required this.fecha,
    required this.ocupados,
    //required this.pista,
  }) : super(key: key);

  final String centro;
  final String lugar;
  final String hora;
  final String fecha;
  final int ocupados;
//  final Pista pista;
  @override
  Widget build(BuildContext context) {
    final datosPista = Provider.of<Datos>(context);
    Pista pista = new Pista();
    return 
    Stack(
      children: [
        //////////////////////////////////////////////////////
        ////////////// CONTENEDOR PARA EL FONDO///////////////
        //////////////////////////////////////////////////////
        Container(
          margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 7.0), 
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
          ),
          ),
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
        ////////////////////////////////////////////////////////////////////
        //////////////////// CONTENEDOR CON LA LOGICA///////////////////////
        ////////////////////////////////////////////////////////////////////
        GestureDetector(
          onTap: () {
        //    datosPista.pistaSeleccionada = pista; // info de la pista
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PaginasInfoPistas()),
            );
          },
          child: Container(
            padding: EdgeInsets.all(6.0), // Sirve para dar espacio por dentro 
            margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 7.0), 
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
                          Text(
                            centro,
                            style: temaApp(),
                          ),
                          Text(
                            lugar,
                            style: temaApp(),
                          ),
                          SizedBox(height: 20),
                          Text(
                            hora,

                          ),
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



///////////////////////////////////////////
// Cuadro para informacion de la pista   //
///////////////////////////////////////////
class cuadroInformacionPista extends StatelessWidget {
  const cuadroInformacionPista({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final pistaSeleccionada = Provider.of<Datos>(context).pistaSeleccionada;
    // DateTime fecha = datos.pistaSeleccionada.fecha;
    // String centroDeportivo = datos.pistaSeleccionada.centroDeportivo;
    // String hora = datos.pistaSeleccionada.hora; 
    

    return Container(
    padding: EdgeInsets.all(6.0), // Sirve para dar espacio por dentro 
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
      border: const BorderDirectional( // borde solo en el lado derecho
        end: BorderSide(
          color: Colors.green,
          width: 5.0, 
        ),
      ),
    ),
        child:  Column(
          children: [
            SizedBox(height: 10),
            Row( // fila 1
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 10),
                      Text(pistaSeleccionada.fecha.toString().substring(0, 10)),
                      SizedBox(width: 40),
                      Text(pistaSeleccionada.hora+ " AM "),
                      SizedBox(width: 40),
                      Text(pistaSeleccionada.centroDeportivo),
                      
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
                  SizedBox(width: 120),
                  Text("Pista numero: "+pistaSeleccionada.nombrePista),
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