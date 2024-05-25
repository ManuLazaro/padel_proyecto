import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:padel_proyecto/modelos/base_de_datos.dart';
import 'package:padel_proyecto/modelos/pista.dart';
import 'package:padel_proyecto/widgets/ThemeApp.dart';


import '../widgets/barra_navegacion.dart';
import '../widgets/boton_largo.dart';

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

  // Pista crearPista = new Pista();

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
      child: Form(
        key: _formkey,
        child: Column( 
          children: [
            PistaPadel(),
            Expanded(
              child: ListView( 
                children: [
                  SizedBox(height: 30.0),
                   ////////////////////////// LABEL CENTRO DEPORTIVO ////////////////////////////////
                  TextFormField(
                    style: TextStyle(color: Colors.white), // Color del texto del usuario que escriba
                    decoration: InputDecoration(
                     labelText: 'Centro deportivo',
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
                        nuevaPista.centroDeportivo=value;
                      }
                    },
                  ),
                  SizedBox(height: 20.0),
                  ////////////////////////// LABEL DIRECCION ////////////////////////////////
                  TextFormField(
                    style: TextStyle(color: Colors.white), // Color del texto del usuario que escriba
                    decoration: InputDecoration(
                     labelText: 'Direccion',
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
                        nuevaPista.direccion=value;
                      }
                    },
                  ),
                  SizedBox(height: 20.0),
                  ////////////////////////// LABEL FECHA ////////////////////////////////
                  TextFormField(
                    keyboardType: TextInputType.datetime,
                    style: TextStyle(color: Colors.white), // Color del texto del usuario
                    decoration: InputDecoration(
                     labelText: 'Fecha',
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
                      DateTime fecha = new DateTime(anio, mes, dia);
                    }
                    catch(e)
                    {
                      return 'La fecha no es correcta';
                    };
                    
                    return null;

                  },
                  onSaved: (valor) {
                    if(valor!=null)
                    {
                    List<String> partes = valor.split("/");
                    int dia = int.tryParse(partes[0])!;
                    int mes = int.tryParse(partes[1])!;
                    int anio = int.tryParse(partes[2])!;
                     nuevaPista.fecha = new DateTime(anio, mes, dia);
                    }
                    },
                  ),
                  SizedBox(height: 20.0),
                 ////////////////////////// LABEL PISTA ////////////////////////////////
                  TextFormField(
                    style: TextStyle(color: Colors.white), // Color del texto del usuario
                    decoration: InputDecoration(
                     labelText: 'Numero de pista',
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
                        nuevaPista.nombrePista=value;
                      }
                    },
                  ),
                  SizedBox(height: 20.0),
                  ////////////////////////// LABEL HORA ////////////////////////////////
                  TextFormField(
                    style: TextStyle(color: Colors.white), // Color del texto del usuario
                    decoration: InputDecoration(
                     labelText: 'Hora',
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
                        nuevaPista.hora=value;
                      }
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    style: TextStyle(color: Colors.white), // Color del texto del usuario
                    decoration: InputDecoration(
                     labelText: 'Precio por persona',
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
                        nuevaPista.precio=int.parse(value);
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
                    DBHelper dbHelper = new DBHelper();
                    dbHelper.insertarTabla('pista', nuevaPista.toMap());
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
            ) // Botón fuera de la ListView
          ],
        ),
      ),
    ),
  //  bottomNavigationBar: barraNavegacion(),
  );
}
}