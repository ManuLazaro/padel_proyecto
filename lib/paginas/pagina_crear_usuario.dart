import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:padel_proyecto/modelos/usuario.dart';

import '../widgets/boton_largo.dart';
import '../widgets/logo.dart';
import '../widgets/text_field.dart';
import 'pagina_crear_jugador.dart';
import 'pagina_principal.dart';

class PaginaEleccion extends StatefulWidget {
  const PaginaEleccion({Key? key}) : super(key: key);

  @override
  State<PaginaEleccion> createState() => _PaginaEleccionState();
}

class _PaginaEleccionState extends State<PaginaEleccion> {
  
  String botonRegistro = 'Registrarse ahora';
  Color colorVerde = Color.fromARGB(255, 29, 88, 29);
  final _formkey=GlobalKey<FormState>();
  Usuario nuevoUsuario=Usuario();

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
     body: Container(
      color: Color.fromARGB(255, 77, 185, 69),
       padding: EdgeInsets.only(top: 80.0, left: 20.0, right: 20.0, bottom: 30.0),
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
            Expanded( // Expanded para el ListView
              child: ListView( 
                children: [    
                  ////////////////////////// LABEL login////////////////////////////////                   
                  TextFormField(
                    style: TextStyle(color: Colors.white), // Color del texto del usuario
                    decoration: InputDecoration(
                     labelText: 'Nombre de Usuario',
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
                        nuevoUsuario.login=value;
                      }
                    },
                  ), 
                  SizedBox(height: 20.0),
                  ////////////////////////// LABEL NOMBRE ////////////////////////////////
                  TextFormField(
                    style: TextStyle(color: Colors.white), // Color del texto del usuario
                    decoration: InputDecoration(
                     labelText: 'Nombre ',
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
                        nuevoUsuario.nombre=value;
                      }
                    },
                  ), 
                  SizedBox(height: 20.0),
                  ////////////////////////// label APELLIDOS////////////////////////////////
                 TextFormField(
                    style: TextStyle(color: Colors.white), // Color del texto del usuario
                    decoration: InputDecoration(
                     labelText: 'Apellidos',
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
                        nuevoUsuario.apellidos=value;
                      }
                    },
                  ), 
                  SizedBox(height: 20.0), 
                  ////////////////////////// LABEL FECHA////////////////////////////////
                 TextFormField(
                    keyboardType: TextInputType.datetime,
                    style: TextStyle(color: Colors.white), // Color del texto del usuario
                    decoration: InputDecoration(
                     labelText: 'Fecha de Nacimiento',
                     labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder( // Borde de color, redondo y grosor
                        borderSide: BorderSide(color: Colors.white, width: 1.0), 
                        borderRadius: BorderRadius.circular(5.0), 
                      ),
                    ),
                    validator: (valor){
                    if (valor==null || valor.isEmpty){
                      return 'El campo no puede estar vacio';
                    }
                    if(RegExp(r'^(\d{2})/(\d{2})/(\d{4})$').hasMatch(valor)==false)
                    {
                      return 'El formato de la fecha no es correcto';
                    }
                    List<String> partes = valor.split("/");
                    int dia = int.tryParse(partes[0])!;
                    int mes = int.tryParse(partes[1])!;
                    int anio = int.tryParse(partes[2])!;

                    try{
                      DateTime fechaDeNacimiento = new DateTime(anio, mes, dia);
                    }
                    catch(e)
                    {
                      return 'La fecha no es correcta';
                    };
                    
                    return null;

                  },
                  onSaved: (valor) {
                  if (valor != null) {
                    List<String> partes = valor.split("/");
                    int dia = int.parse(partes[0]);
                    int mes = int.parse(partes[1]);
                    int anio = int.parse(partes[2]);
                    nuevoUsuario.fechaDeNacimiento = DateTime(anio, mes, dia);
                  }
                },
                  ),
                  SizedBox(height: 20.0),
                  ////////////////////////// LABEL PASSWORD ////////////////////////////////
                 TextFormField(
                    style: TextStyle(color: Colors.white), // Color del texto del usuario
                    decoration: InputDecoration(
                     labelText: 'Contraseña',
                     labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder( // Borde de color, redondo y grosor
                        borderSide: BorderSide(color: Colors.white, width: 1.0), 
                        borderRadius: BorderRadius.circular(5.0), 
                      ),
                    ),
                    obscureText: true, // Ocultar el texto
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
                        nuevoUsuario.password=value;
                      }
                    },
                  ), 
                   ////////////////////////// LABEL ROL ////////////////////////////////
                  DropdownButtonFormField<String>(          
                    decoration: InputDecoration(
                      labelText: 'Rol',
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
                        value: 'Gestor',
                        child: Text('Gestor'),
                      ),
                      DropdownMenuItem(
                        value: 'Jugador',
                        child: Text('Jugador'),
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
                        nuevoUsuario.rol = value as int;
                      }
                    },
                  ),
                SizedBox(height: 20.0), 
                ],
              ),
            ),
            ////////////////////////// BOTON//////////////////////////////// 
             SizedBox(height: 30.0), 
            ElevatedButton( 
                    onPressed: () {
                      if(_formkey.currentState!.validate())
                      {
                          _formkey.currentState!.save();
                          
                          
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaginaCrearJugador(),
                            ),
                          );
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
 