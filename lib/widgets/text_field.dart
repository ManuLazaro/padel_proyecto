import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class textField extends StatelessWidget {
  const textField(String nombre, {
    super.key,
    required this.texto, //Lo que va escrito sobre el textField
    this.ocultarTexto = false, // Para contraseñas
  });
  final String texto;
  final bool ocultarTexto;

  @override
  Widget build(BuildContext context) {
    return Container( // Hueco para el textField
       decoration: BoxDecoration(
         color: Colors.transparent,
         borderRadius: BorderRadius.circular(5.0),
         border: Border(bottom: BorderSide(color: Colors.white, width: 2.0)),
       ),
       child: TextField( 
         style: TextStyle(color: Colors.black),
         obscureText: ocultarTexto,
         decoration: InputDecoration(
           hintText: texto,
           hintStyle: TextStyle(color: Colors.white),
           contentPadding: EdgeInsets.all(10.0),
           border: InputBorder.none,
         ),
       ),
     );
  }
}
