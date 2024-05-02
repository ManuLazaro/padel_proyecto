import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/boton_largo.dart';
import '../widgets/text_field.dart';

class PaginaRegistrarse extends StatefulWidget {
  const PaginaRegistrarse({super.key});

  @override
  State<PaginaRegistrarse> createState() => _PaginaRegistrarseState();
}

class _PaginaRegistrarseState extends State<PaginaRegistrarse> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'REGISTRARSE', 
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
      body: Container(
        color: Color.fromARGB(255, 77, 185, 69),
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [     
           textField(),
            SizedBox(height: 20.0),
            botonLargo(),
          ],
        ),
      ),
    );
  }
}


