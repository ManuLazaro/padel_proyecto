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
        child: Column( // PRIMER LISTVIEW CON EL BOTON
          children: [
            PistaPadel(),
            Expanded(
              child: ListView( // SEGUNDO LISTVIEW CON LOS TEXTFIELD
                children: [
                  SizedBox(height: 30.0),
                  TextFormField(
                    decoration: InputDecoration(
                    label: Text('Direccion',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    hintStyle: TextStyle(color: Colors.white),
                    contentPadding: EdgeInsets.all(10.0),
                    border: InputBorder.none,
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
                  textField(texto: 'Direccion',),
                  SizedBox(height: 20.0),
                  textField( texto: 'Fecha',),
                  SizedBox(height: 20.0),
                  textField( texto: 'Hora',),
                  SizedBox(height: 20.0),
                  textField( texto: 'Pista',),
                  SizedBox(height: 20.0),
                  textField( texto: 'Precio por persona',),
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
                          ) // Botón fuera de la ListView
          ],
        ),
      ),
    ),
  //  bottomNavigationBar: barraNavegacion(),
  );
}
}