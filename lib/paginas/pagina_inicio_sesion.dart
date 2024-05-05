import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/boton_largo.dart';
import '../widgets/logo.dart';
import '../widgets/text_field.dart';

class PaginaInicioSesion extends StatefulWidget {
  const PaginaInicioSesion({Key? key}) : super(key: key);

  @override
  State<PaginaInicioSesion> createState() => _PaginaInicioSesionState();
}

class _PaginaInicioSesionState extends State<PaginaInicioSesion> {
  @override
  Widget build(BuildContext context) {
    String texto = 'Usuario';
    String botonInicio = 'Iniciar Sesión';
    String botonRegistro = '¿No tienes cuenta? Regístrate';
    Color colorVerde = Color.fromARGB(255, 4, 31, 4);
    Color colorBlanco = Color.fromARGB(255, 29, 88, 29);

    return Scaffold(
      body: Stack(
        children: [  
          Container(
            color: Color.fromARGB(255, 77, 185, 69), // fondo 
          ),
          const Positioned( // icono de la raqueta
            top: 500.0,
            right: 0.0,
            child: Opacity(
              opacity: 0.4,
              child: Icon(
                Icons.sports_tennis,
                size: 300.0,
                color: Colors.white,
              ),
            ),
          ),
          Center(
            child: Column( // columna con el titulo, los textField y los botones
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PistaPadel(), // logo
                SizedBox(height: 5.0),
                Text( 
                  'Padel',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 50.0),
                Container(
                 padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                   children: [
                      textField(texto, texto: 'Usuario',),
                      SizedBox(height: 10.0),
                      textField(texto, texto: 'Contraseña',ocultarTexto: true),
                      SizedBox(height: 10.0),
                      textField(texto, texto: 'Repetir Contraseña',ocultarTexto: true),
                      SizedBox(height: 20.0),
                      botonLargo(nombre: botonInicio, color: colorVerde,),
                      SizedBox(height: 10.0),
                      botonLargo(nombre: botonRegistro, color: colorBlanco,)
                    ],
                  ),
                ),
                SizedBox(height: 100.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
