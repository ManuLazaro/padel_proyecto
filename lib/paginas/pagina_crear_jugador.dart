import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:padel_proyecto/modelos/base_de_datos.dart';
import 'package:padel_proyecto/modelos/jugador.dart';
import 'package:padel_proyecto/provider/datos_usuario.dart';
import 'package:padel_proyecto/widgets/ThemeApp.dart';
import 'package:provider/provider.dart';

import 'pagina_principal.dart';

class PaginaCrearJugador extends StatefulWidget {
  const PaginaCrearJugador({super.key});

  @override
  State<PaginaCrearJugador> createState() => _PaginaCrearJugadorState();
}

class _PaginaCrearJugadorState extends State<PaginaCrearJugador> {
  
   
  String texto= "";
  String botonRegistro = 'Registrarse ahora';
  Color colorVerde = Color.fromARGB(255, 29, 88, 29);
  final _formkey=GlobalKey<FormState>();
  

  @override
Widget build(BuildContext context) {
   
  final datos = Provider.of<Datos>(context);
  int idUsuario = datos.usuarioActual.id;
  Jugador nuevoJugador=Jugador(idUsuario);
  
  return Scaffold(
    appBar: AppBar(
      title: Text(
        'DATOS DEL JUGADOR', 
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
             SizedBox(height: 5.0),
                  const Text(  // texto
                    'Padel',
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.white,
                    ),
                  ),
              SizedBox(height: 30.0),
            Expanded( // Expanded para el ListView
              child: ListView( 
                children: [    
                  ////////////////////////// LABEL NIVEL////////////////////////////////                   
                  DropdownButtonFormField<String>(          
                    decoration: InputDecoration(
                      labelText: 'Nivel',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder( 
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                    dropdownColor: Colors.green, 
                    items: [ // OPCIONES DEL DROPDOWNBUTTON
                      DropdownMenuItem(
                        value: 'Principiante',
                        child: Text('Principiante'),
                      ),
                      DropdownMenuItem(
                        value: 'Amateur',
                        child: Text('Amateur'),
                      ),
                      DropdownMenuItem(
                        value: 'Medio',
                        child: Text('Medio'),
                      ),
                      DropdownMenuItem(
                        value: 'Avanzado',
                        child: Text('Avanzado'),
                      ),
                      DropdownMenuItem(
                        value: 'Profesional',
                        child: Text('Profesional'),
                      ),   
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "No puede estar vacio";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                     
                    },
                    onSaved: (value) {
                      if (value != null) {
                        nuevoJugador.nivel = value ;
                      }
                    },
                  ),
                  SizedBox(height: 20.0),
                  ////////////////////////// LABEL CODIGO POSTAL////////////////////////////////
                  TextFormField(
                    style: TextStyle(color: Colors.white), // Color del texto del usuario
                    decoration: InputDecoration(
                     labelText: 'Codigo Postal',
                     labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder( // Borde de color, redondo y grosor
                        borderSide: BorderSide(color: Colors.white, width: 1.0), 
                        borderRadius: BorderRadius.circular(5.0), 
                      ),
                    ),
                    validator: (value) {
                      if((value==null)||(value.isEmpty))
                      {
                        return "No puede estar vacio";
                      }
                      else
                      {
                       // comprobar si tiene 5 caracteres exacto
                          RegExp regex = RegExp(r'^[0-9]{5}$');
                          if (!regex.hasMatch(value)) {
                            return "Código postal no valido";
                          }
                        }
                        return null;
                      },
                    onSaved: (value) {
                      if(value!=null)
                      {
                        print(value);
                        nuevoJugador.codigoPostal=int.parse(value);
                      }
                    },
                  ),
                  SizedBox(height: 20.0),
                  ////////////////////////// label telefono////////////////////////////////
                  TextFormField(
                    style: TextStyle(color: Colors.white), // Color del texto del usuario
                    decoration: InputDecoration(
                     labelText: 'Telefono personal',
                     labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder( // Borde de color, redondo y grosor
                        borderSide: BorderSide(color: Colors.white, width: 1.0), 
                        borderRadius: BorderRadius.circular(5.0), 
                      ),
                    ),
                    validator: (value) {
                      if((value==null)||(value.isEmpty))
                      {
                        return "No puede estar vacio";
                      }
                      else
                      {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      if(value!=null)
                      {
                        nuevoJugador.telefono=value;
                      }
                    },
                  ),
                  SizedBox(height: 50.0), 
                  ////////////////////////// BOTON////////////////////////////////
                  ElevatedButton( 
                    onPressed: () {
                      if(_formkey.currentState!.validate()) {
                        _formkey.currentState!.save();
                        DBHelper dbHelper = DBHelper();
                        nuevoJugador.usuarioId = idUsuario; 
                        dbHelper.insertarJugador(nuevoJugador).then((id) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaginaPrincipal(),
                            ),
                          );
                        });
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
            
            
          ],
        ),
      ),
    ),
  );
}
}


