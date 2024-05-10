import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:padel_proyecto/main.dart';
import 'package:padel_proyecto/rutas/rutas.dart';
import 'package:padel_proyecto/widgets/menu_lateral.dart';
import 'package:padel_proyecto/widgets/barra_navegacion.dart';

import '../modelos/gestor.dart';
import '../widgets/boton_largo.dart';
import '../widgets/logo.dart';
import '../widgets/text_field.dart';
class PaginaCrearGestor extends StatefulWidget {
  const PaginaCrearGestor({super.key});

  @override
  State<PaginaCrearGestor> createState() => _PaginaCrearGestorState();
}

class _PaginaCrearGestorState extends State<PaginaCrearGestor> {
   
   
  String texto= "";
  String botonRegistro = 'Registrarse ahora';
  Color colorVerde = Color.fromARGB(255, 29, 88, 29);
  final _formkey=GlobalKey<FormState>();
  Gestor nuevoGestor= Gestor();

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        'DATOS DEL GESTOR', 
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
      child: Form( // Todo dentro de un form 
        key: _formkey,
        child: Column( 
          children: [
            PistaPadel(), //logo fuera del ListView
             SizedBox(height: 30.0),
            Expanded( // Expanded para el ListView
              child: ListView( 
                children: [
                  TextFormField(
                    style: TextStyle(color: Colors.white), // Color del texto del usuario
                    decoration: InputDecoration(
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
                        return "El Usuario no puede estar vacio";
                      }
                      else
                      {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      if(value!=null)
                      {
                        nuevoGestor.usuario=value;
                      }
                    },
                  ),
                  SizedBox(height: 20.0),
                 TextFormField(
                    style: TextStyle(color: Colors.white), // Color del texto del usuario
                    decoration: InputDecoration(
                     labelText: 'Nombre',
                     labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      enabledBorder: UnderlineInputBorder( // Borde de color, redondo y grosor
                        borderSide: BorderSide(color: Colors.white, width: 2.0), 
                        borderRadius: BorderRadius.circular(5.0), 
                      ),
                    ),
                    validator: (value) {
                      if((value==null)||(value.isEmpty))
                      {
                        return "El nombre no puede estar vacio";
                      }
                      else
                      {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      if(value!=null)
                      {
                        nuevoGestor.nombre=value;
                      }
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    style: TextStyle(color: Colors.white), // Color del texto del usuario
                    decoration: InputDecoration(
                     labelText: 'Apellidos',
                     labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      enabledBorder: UnderlineInputBorder( // Borde de color, redondo y grosor
                        borderSide: BorderSide(color: Colors.white, width: 2.0), 
                        borderRadius: BorderRadius.circular(5.0), 
                      ),
                    ),
                    validator: (value) {
                      if((value==null)||(value.isEmpty))
                      {
                        return "Los apellidos no pueden estar vacio";
                      }
                      else
                      {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      if(value!=null)
                      {
                        nuevoGestor.apellidos=value;
                      }
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    style: TextStyle(color: Colors.white), // Color del texto del usuario
                    decoration: InputDecoration(
                     labelText: 'Fecha de nacimiento',
                     labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      enabledBorder: UnderlineInputBorder( // Borde de color, redondo y grosor
                        borderSide: BorderSide(color: Colors.white, width: 2.0), 
                        borderRadius: BorderRadius.circular(5.0), 
                      ),
                    ),
                    validator: (value) {
                      if((value==null)||(value.isEmpty))
                      {
                        return "La fecha no puede estar vacia";
                      }
                      else
                      {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      if(value!=null)
                      {
                        nuevoGestor.fechaDeNacimiento=value;
                      }
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    style: TextStyle(color: Colors.white), // Color del texto del usuario
                    decoration: InputDecoration(
                     labelText: 'Centro Deportivo',
                     labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      enabledBorder: UnderlineInputBorder( // Borde de color, redondo y grosor
                        borderSide: BorderSide(color: Colors.white, width: 2.0), 
                        borderRadius: BorderRadius.circular(5.0), 
                      ),
                    ),
                    validator: (value) {
                      if((value==null)||(value.isEmpty))
                      {
                        return "El Centro Deportivo  no puede estar vacio";
                      }
                      else
                      {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      if(value!=null)
                      {
                        nuevoGestor.centroDeportivo=value;
                      }
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    style: TextStyle(color: Colors.white), // Color del texto del usuario
                    decoration: InputDecoration(
                     labelText: 'Numero de pistas disponibles',
                     labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      enabledBorder: UnderlineInputBorder( // Borde de color, redondo y grosor
                        borderSide: BorderSide(color: Colors.white, width: 2.0), 
                        borderRadius: BorderRadius.circular(5.0), 
                      ),
                    ),
                    validator: (value) {
                      if((value==null)||(value.isEmpty))
                      {
                        return "El numero de pistas disponibles no puede estar vacio";
                      }
                      else
                      {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      if(value!=null)
                      {
                        nuevoGestor.numPistas=value;
                      }
                    },
                  ),
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
                        nuevoGestor.password=value;
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
                        nuevoGestor.password2=value;
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0), // Espacio entre la ListView y el botón
            ElevatedButton( // boton 
              onPressed: () {
                if(_formkey.currentState!.validate())
                {
                    _formkey.currentState!.save();
                    //insertar en base de datos
                    print(nuevoGestor.usuario);
                    //retornar con pop a la pantalla anterior
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: colorVerde, 
                shape: RoundedRectangleBorder( // forma de rectangulo
                  borderRadius: BorderRadius.circular(5.0), 
                ),
              ),
              child: SizedBox( // una caja dentro para darle forma
                width: double.infinity,// ocuoa todo lo ancho
                child: Text(
                  botonRegistro,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              
            ) 
          ],
        ),
      ),
    ),
  );
}
}


