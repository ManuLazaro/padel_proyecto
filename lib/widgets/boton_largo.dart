
import 'package:flutter/material.dart';

class botonLargo extends StatelessWidget {
  const botonLargo({
    super.key,
    required this.nombre,
    required this.color,
  });

  final String nombre;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton( // boton estandar de la aplicacion
     onPressed: () {},
     style: ElevatedButton.styleFrom(
       backgroundColor: color, 
       shape: RoundedRectangleBorder( // forma de rectangulo
         borderRadius: BorderRadius.circular(5.0), 
       ),
     ),
     child: SizedBox( // una caja dentro para darle forma
       width: double.infinity,// ocuoa todo lo ancho
       child: Text(
         nombre,
         textAlign: TextAlign.center,
         style: TextStyle(
           color: Colors.white,
         ),
       ),
     ),
                );
  }
}