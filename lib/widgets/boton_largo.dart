
import 'package:flutter/material.dart';

class botonLargo extends StatelessWidget {
  const botonLargo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton( // boton estandar de la aplicacion
     onPressed: () {},
     style: ElevatedButton.styleFrom(
       backgroundColor: Color.fromARGB(255, 29, 88, 29), 
       shape: RoundedRectangleBorder( // forma de rectangulo
         borderRadius: BorderRadius.circular(5.0), 
       ),
     ),
     child: SizedBox( // una caja dentro para darle forma
       width: double.infinity,// ocuoa todo lo ancho
       child: Text(
         'Guardar',
         textAlign: TextAlign.center,
         style: TextStyle(
           color: Colors.white,
         ),
       ),
     ),
                );
  }
}