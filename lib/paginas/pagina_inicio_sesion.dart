import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:padel_proyecto/modelos/jugador.dart';

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
    
    String botonInicio = 'Iniciar Sesión';
    String botonRegistro = '¿No tienes cuenta? Regístrate';
    Color colorVerde = Color.fromARGB(255, 4, 31, 4);
    Color colorBlanco = Color.fromARGB(255, 29, 88, 29);
    String texto= "";
    final _formkey=GlobalKey<FormState>();
    Jugador nuevoJugador=Jugador();

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
          Container(
            padding: EdgeInsets.only(top: 100, left: 20, right: 20),
            child: Form(
              key: _formkey,  
              child: Column( 
                children: [
                  PistaPadel(), // logo
                  SizedBox(height: 5.0),
                  Text(  // texto
                    'Padel',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Expanded(
                    child: ListView(
                       children: [
                          TextFormField(
                            style: TextStyle(color: Colors.white), // Color del texto del usuario
                            decoration: InputDecoration(
                            // label: Text('Direccion',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            labelText: 'Usuario',
                            labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              enabledBorder: UnderlineInputBorder( // Borde de color, redondo y grosor
                                borderSide: BorderSide(color: Colors.white, width: 2.0), 
                                borderRadius: BorderRadius.circular(5.0), 
                              ),
                            ),
                            validator: (value) {
                              if((value==null)||(value.isEmpty))
                              {
                                return "El usuario no puede estar vacio";
                              }
                              else
                              {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              if(value!=null)
                              {
                                nuevoJugador.usuario=value;
                              }
                            },
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            style: TextStyle(color: Colors.white), // Color del texto del usuario
                            decoration: InputDecoration(
                            labelText: 'Contraseña',
                            labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              enabledBorder: UnderlineInputBorder( // Borde de color, redondo y grosor
                                borderSide: BorderSide(color: Colors.white, width: 2.0), 
                                borderRadius: BorderRadius.circular(5.0), 
                              ),
                            ),
                            validator: (value) {
                              if((value==null)||(value.isEmpty))
                              {
                                return "La contraseña  no puede estar vacia";
                              }
                              else
                              {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              if(value!=null)
                              {
                                nuevoJugador.password=value;
                              }
                            },
                          ),
                           SizedBox(height: 20.0),
                          TextFormField(
                            style: TextStyle(color: Colors.white), // Color del texto del usuario
                            decoration: InputDecoration(
                            labelText: 'Repetir Contraseña',
                            labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              enabledBorder: UnderlineInputBorder( // Borde de color, redondo y grosor
                                borderSide: BorderSide(color: Colors.white, width: 2.0), 
                                borderRadius: BorderRadius.circular(5.0), 
                              ),
                            ),
                            validator: (value) {
                              if((value==null)||(value.isEmpty))
                              {
                                return "La contraseña no puede estar vacia";
                              }
                              else
                              {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              if(value!=null)
                              {
                                nuevoJugador.password2=value;
                              }
                            },
                          ),
                        ],                     
                    ),
                  ),              
                    botonLargo(nombre: botonInicio, color: colorVerde,),
                    SizedBox(height: 10.0),
                    botonLargo(nombre: botonRegistro, color: colorBlanco,),
                    SizedBox(height: 140.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
