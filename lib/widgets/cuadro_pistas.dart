import 'package:flutter/material.dart';

class cuadroPistas extends StatelessWidget {
  const cuadroPistas({
    super.key,
    required this.centro,
    required this.lugar,
    required this.hora,
    required this.fecha,
    required this.ocupados,
  });

  final String centro;
  final String lugar;
  final String hora;
  final String fecha;
  final int ocupados;

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
        border: BorderDirectional( // borde solo en el lado derecho
          end: BorderSide(
            color:(ocupados!=4)? Colors.green:Colors.black,
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
          Text(centro),
          Text(lugar),
          SizedBox(height: 30),
          Text(hora),
        ],
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
        );
  }
}

class cuadroInformacionPista extends StatelessWidget {
  const cuadroInformacionPista({
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






// class _cuadroPistas extends StatelessWidget {
//   const _cuadroPistas({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//   padding: EdgeInsets.all(6.0), // Sirve para dar espacio por dentro 
//   margin: EdgeInsets.symmetric(vertical: 35.0, horizontal: 4.0), 
//   height: 110,
//   decoration: BoxDecoration(
//     color: Color.fromARGB(255, 255, 255, 255),
//     borderRadius: BorderRadius.circular(5.0), // Bordes redondos
//     boxShadow: const [
//       BoxShadow(
//         color: Color.fromARGB(255, 108, 114, 108), 
//         blurRadius: 2.0, 
//         offset: Offset(1, 2), // Sombra por un lado y por abajo
//       ),
//     ],
//     border: const BorderDirectional( // borde solo en el lado derecho
//       end: BorderSide(
//         color: Colors.green,
//         width: 5.0, 
//       ),
//     ),
//   ),
//       child: Row(   
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center, // lo coloca en el centro
//               children: [
//                 Text('Centro de Padeeeeeeeeeeeeeeel Valladolid'),
//                 Text('Calle del padel 44'),
//                 SizedBox(height: 30),
//                 Text('11:00 - 12:00 AM'),
//               ],
//             ),
//           ),
//           SizedBox(width: 20),
//           Text('30/12/2025'),
//           SizedBox(width: 20),
//           Container(
//             width: 1,
//              margin: EdgeInsets.only(right: 8.0),
//             decoration: BoxDecoration(
//               color: Colors.black
//             ),
//           ),
//           SizedBox(width: 9),
//           Container(
//             margin: EdgeInsets.only(right: 8.0), // Margen agregado solo en la parte izquierda
//             child: _huecosDisponibles()),
            
//         ],
//       ),
//     );
//   }
// }

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


