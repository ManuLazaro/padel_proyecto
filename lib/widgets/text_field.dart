import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class textField extends StatelessWidget {
  const textField({
    super.key,
  });

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
         decoration: InputDecoration(
           hintText: 'Nombre',
           hintStyle: TextStyle(color: Colors.white),
           contentPadding: EdgeInsets.all(10.0),
           border: InputBorder.none,
         ),
       ),
     );
  }
}