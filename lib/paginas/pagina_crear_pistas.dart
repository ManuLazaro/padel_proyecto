import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:padel_proyecto/modelos/pista.dart';


import '../widgets/barra_navegacion.dart';
import '../widgets/boton_largo.dart';
import '../widgets/logo.dart';
import '../widgets/text_field.dart';

class PaginaCrearPistas extends StatefulWidget {
  const PaginaCrearPistas({super.key});

  @override
  State<PaginaCrearPistas> createState() => _PaginaCrearPistasState();
}

class _PaginaCrearPistasState extends State<PaginaCrearPistas> {
   
  String botonRegistro = 'Crear pista';
  Color colorVerde = Color.fromARGB(255, 29, 88, 29);
  String texto= "";
  final _formkey=GlobalKey<FormState>();
  Pista nuevaPista=Pista();

  

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        'Añadir  pista', 
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
            Expanded( // Expanded para el ListView
              child: ListView( 
                children: [
                  SizedBox(height: 30.0),
                  TextFormField(
                    style: TextStyle(color: Colors.white), // Color del texto del usuario
                    decoration: InputDecoration(
                     // label: Text('Direccion',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                     labelText: 'Direccion',
                     labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      enabledBorder: UnderlineInputBorder( // Borde de color, redondo y grosor
                        borderSide: BorderSide(color: Colors.white, width: 2.0), 
                        borderRadius: BorderRadius.circular(5.0), 
                      ),
                    ),
                    validator: (value) {
                      if((value==null)||(value.isEmpty))
                      {
                        return "La direccion no puede estar vacia";
                      }
                      else
                      {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      if(value!=null)
                      {
                        nuevaPista.direccion=value;
                      }
                    },
                  ),
                  SizedBox(height: 20.0),
                 TextFormField(
                    style: TextStyle(color: Colors.white), // Color del texto del usuario
                    decoration: InputDecoration(
                     labelText: 'Fecha',
                     labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      enabledBorder: UnderlineInputBorder( // Borde de color, redondo y grosor
                        borderSide: BorderSide(color: Colors.white, width: 2.0), 
                        borderRadius: BorderRadius.circular(5.0), 
                      ),
                    ),
                    validator: (value) {
                      if((value==null)||(value.isEmpty))
                      {
                        return "La Fecha no puede estar vacia";
                      }
                      else
                      {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      if(value!=null)
                      {
                        nuevaPista.fecha=value;
                      }
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    style: TextStyle(color: Colors.white), // Color del texto del usuario
                    decoration: InputDecoration(
                     labelText: 'Hora',
                     labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      enabledBorder: UnderlineInputBorder( // Borde de color, redondo y grosor
                        borderSide: BorderSide(color: Colors.white, width: 2.0), 
                        borderRadius: BorderRadius.circular(5.0), 
                      ),
                    ),
                    validator: (value) {
                      if((value==null)||(value.isEmpty))
                      {
                        return "La Hora no puede estar vacia";
                      }
                      else
                      {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      if(value!=null)
                      {
                        nuevaPista.hora=value;
                      }
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    style: TextStyle(color: Colors.white), // Color del texto del usuario
                    decoration: InputDecoration(
                     labelText: 'Pista',
                     labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      enabledBorder: UnderlineInputBorder( // Borde de color, redondo y grosor
                        borderSide: BorderSide(color: Colors.white, width: 2.0), 
                        borderRadius: BorderRadius.circular(5.0), 
                      ),
                    ),
                    validator: (value) {
                      if((value==null)||(value.isEmpty))
                      {
                        return "El numero de Pista no puede estar vacio";
                      }
                      else
                      {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      if(value!=null)
                      {
                        nuevaPista.pista=value;
                      }
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    style: TextStyle(color: Colors.white), // Color del texto del usuario
                    decoration: InputDecoration(
                     labelText: 'Precio por persona',
                     labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      enabledBorder: UnderlineInputBorder( // Borde de color, redondo y grosor
                        borderSide: BorderSide(color: Colors.white, width: 2.0), 
                        borderRadius: BorderRadius.circular(5.0), 
                      ),
                    ),
                    validator: (value) {
                      if((value==null)||(value.isEmpty))
                      {
                        return "El precio por persona no puede estar vacio";
                      }
                      else
                      {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      if(value!=null)
                      {
                        nuevaPista.precio=value;
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0), // Espacio entre la ListView y el botón
            ElevatedButton( // boton estandar de la aplicacion
              onPressed: () {
                if(_formkey.currentState!.validate())
                {
                    _formkey.currentState!.save();
                    //insertar en base de datos
                    print(nuevaPista.direccion);
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