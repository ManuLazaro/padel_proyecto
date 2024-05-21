import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:padel_proyecto/modelos/jugador.dart';
import 'package:padel_proyecto/modelos/usuario.dart';
import 'package:padel_proyecto/paginas/pagina_principal.dart';
import 'package:padel_proyecto/provider/datos_usuario.dart';
import 'package:provider/provider.dart';

import '../widgets/boton_largo.dart';
import '../widgets/logo.dart';
import '../widgets/text_field.dart';
import 'pagina_crear_usuario.dart';

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
    final datosUsuario = Provider.of<Datos>(context);
  
    String texto= "";
    final _formkey=GlobalKey<FormState>();
    Usuario nuevoUsuario=Usuario();

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
                                nuevoUsuario.login=value;
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
                            obscureText: true, // Ocultar el texto
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
                                nuevoUsuario.password=value;
                              }
                            },
                          ),                     
                          SizedBox(height: 20.0),
                          ElevatedButton( //BOTON 1
                            onPressed: () {
                              if(_formkey.currentState!.validate())
                              {
                                  _formkey.currentState!.save();                    
                                  print(nuevoUsuario.login);

                                  nuevoUsuario.nombre= nuevoUsuario.login;
                                  datosUsuario.usuarioActual=nuevoUsuario;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PaginaPrincipal(),
                                    ),
                                  );
                              }
                  
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 4, 31, 4), 
                              shape: RoundedRectangleBorder( // forma de rectangulo
                                borderRadius: BorderRadius.circular(5.0), 
                              ),
                            ),
                            child: SizedBox( // una caja dentro para darle forma
                              width: double.infinity,// ocuoa todo lo ancho
                              child: Text(
                                'Iniciar Sesión',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                            
                    SizedBox(height: 10.0),
                    ElevatedButton( // BOTON 2
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaginaEleccion(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 29, 88, 29), 
                        shape: RoundedRectangleBorder( // forma de rectangulo
                          borderRadius: BorderRadius.circular(5.0), 
                        ),
                      ),
                      
                      child: SizedBox( // una caja dentro para darle forma
                        width: double.infinity,// ocuoa todo lo ancho
                        child: Text(
                          '¿No tienes cuenta? Regístrate',
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
