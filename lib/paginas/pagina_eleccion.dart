import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/boton_largo.dart';
import '../widgets/logo.dart';
import '../widgets/text_field.dart';
import 'pagina_crear_jugador.dart';

class PaginaEleccion extends StatefulWidget {
  const PaginaEleccion({Key? key}) : super(key: key);

  @override
  State<PaginaEleccion> createState() => _PaginaEleccionState();
}

class _PaginaEleccionState extends State<PaginaEleccion> {
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      body: Stack(
        children: [  
          Container(
            color: Color.fromARGB(255, 77, 185, 69), // fondo 
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
                SizedBox(height: 90.0),
                Container(
                 padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                   children: [
                      ElevatedButton(  // BOTON 1
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaginaCrearJugador(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 4, 31, 4), 
                        shape: RoundedRectangleBorder( 
                          borderRadius: BorderRadius.circular(5.0), 
                        ),
                      ),
                      child: SizedBox( 
                        width: double.infinity,
                        child: Text(
                          'JUGADOR',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                     ),
                      SizedBox(height: 10.0),
                      ElevatedButton( 
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaginaCrearJugador(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom( // BOTON 2
                        backgroundColor: Color.fromARGB(255, 29, 88, 29), 
                        shape: RoundedRectangleBorder( 
                          borderRadius: BorderRadius.circular(5.0), 
                        ),
                      ),
                      child: SizedBox( 
                        width: double.infinity,
                        child: Text(
                          'GESTOR',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                     ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Text( 
                  'Explicacion de que hace cada cosa',
                  style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 140.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
