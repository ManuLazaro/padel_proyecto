import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:padel_proyecto/modelos/base_de_datos.dart';
import 'package:padel_proyecto/modelos/jugador.dart';
import 'package:padel_proyecto/paginas/pagina_principal.dart';
import 'package:padel_proyecto/provider/datos_usuario.dart';
import 'package:padel_proyecto/rutas/rutas.dart';
import 'package:padel_proyecto/widgets/ThemeApp.dart';
import 'package:padel_proyecto/widgets/cuadro_pistas.dart';
import 'package:padel_proyecto/widgets/menu_lateral.dart';
import 'package:padel_proyecto/widgets/barra_navegacion.dart';
import 'package:provider/provider.dart';
class PaginasInfoPistas extends StatefulWidget {
  const PaginasInfoPistas({super.key});

  @override
  State<PaginasInfoPistas> createState() => _PaginasInfoPistasState();
}

class _PaginasInfoPistasState extends State<PaginasInfoPistas> {
  @override
  Widget build(BuildContext context) {

    final datos= Provider.of<Datos>(context);
    String nombre = datos.usuarioActual.nombre;
    int idUsuario = datos.usuarioActual.id;

    int jugadoresTotales = datos.pistaSeleccionada.jugadores;
    Jugador jugador = Jugador(idUsuario);
    
    String nivel = 'Nivel amateur';
    int partidos = 23;
    
    

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'INFORMACION DE LA PISTA', 
          style: temaAppBar(),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 77, 185, 69),
          ),
        ),
      ),
      drawer: menuLateral(), 
      body: ListView(
        children: [
          cuadroInformacionPista(),
          Expanded(
          child: FutureBuilder(
                future: jugador.getJugadores(true),
                builder: (context, AsyncSnapshot<List<Jugador>> snapshot) {
                  if(snapshot.hasData){
                    print(snapshot.data!.length);
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context,index){
                       return cuadroJugadores(nombre: snapshot.data![index].nombre, nivel: snapshot.data![index].nivel, partidos:2);
                      });
                  }
                  else{
                    return Center(child: Text(""),);
                  }
                },
            ),
        ),
       
          cuadroJugadores(nombre: nombre, nivel: nivel, partidos: partidos),     
          SizedBox(height: 10),

          Container( ///// BOTON RESERVAR
            margin: EdgeInsets.symmetric(horizontal: 110),
            child: ElevatedButton( 
                          onPressed: () async{   
                            // sumamos 1 jugador
                            int nuevosJugadores = jugadoresTotales + 1;
                            await DBHelper().actualizarPista(1, nuevosJugadores);
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaginaPrincipal(),
                            ),
                        );
                          },
                          style: ElevatedButton.styleFrom( 
                            backgroundColor: Color.fromARGB(255, 77, 185, 69),
                            shape: RoundedRectangleBorder( 
                              borderRadius: BorderRadius.circular(5.0), 
                            ),
                          ),
                          child: SizedBox( 
                            child: Text(
                              'Reservar',
                              textAlign: TextAlign.center,
                              style: temaBoton(),
                            ),
                          ),
               ),
          ),
        ],

      ),
      
      
      backgroundColor: Color.fromARGB(255, 203, 216, 203),
    );
  }

  
}

