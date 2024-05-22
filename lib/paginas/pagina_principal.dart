import 'package:flutter/material.dart';
import 'package:padel_proyecto/modelos/pista.dart';
import 'package:padel_proyecto/paginas/pagina_crear_pistas.dart';
import 'package:padel_proyecto/paginas/pagina_info_pistas.dart';
import 'package:padel_proyecto/rutas/rutas.dart';
import 'package:padel_proyecto/widgets/cuadro_pistas.dart';
import 'package:padel_proyecto/widgets/menu_lateral.dart';
import 'package:padel_proyecto/widgets/barra_navegacion.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({Key? key}) : super(key: key);

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  Pista pista = new Pista();
  @override
  Widget build(BuildContext context) {
    String centro = 'Padel centro de valladolid';
    String lugar = 'Calle alguna de algo';
    String fecha = '12/12/2025';
    String hora = '12:00 - 13:00 ';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PISTAS DISPONIBLES', 
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 77, 185, 69),
          ),
        ),
      ),
      drawer: menuLateral(), 
      body: FutureBuilder(
              future: pista.getPistas(true),
              builder: (context, AsyncSnapshot<List<Pista>> snapshot) {
                if(snapshot.hasData){
                  print(snapshot.data!.length);
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context,index){
                      return cuadroPistas(centro: "Centro "+ index.toString(), lugar: snapshot.data![index].direccion, hora: snapshot.data![index].hora, fecha: snapshot.data![index].fecha.toString().substring(0,10), ocupados: snapshot.data![index].jugadores);
                    });
                }
                else{
                  return Center(child: Text("cargando"),);
                }
              },
      ),
      // Column(
      //   children: [
      //     Stack(
      //       children: [ /////// BOTONES DE ARRIBA PARA ORDENAR////
      //         Padding(
      //           padding: const EdgeInsets.only(left: 70.0),
      //           child: Row(
      //             children: [
      //               ElevatedButton(
      //                 onPressed: () {
                        
      //                 },
      //                 child: Text('Fecha', style: TextStyle(fontSize: 15, color: Colors.white)),
      //                 style: ElevatedButton.styleFrom(
      //                   backgroundColor: Color.fromARGB(255, 77, 185, 69), 
      //                   shape: RoundedRectangleBorder(),// forma rectangulo                  
      //                   minimumSize: Size(60, 30), 
      //                 ),
      //               ),
      //               ElevatedButton(
      //                 onPressed: () {
      //                 },
      //                 child: Text('Nivel', style: TextStyle(fontSize: 15, color: Colors.white)),
      //                 style: ElevatedButton.styleFrom(
      //                   backgroundColor: Color.fromARGB(255, 77, 185, 69), 
      //                   shape: RoundedRectangleBorder(),// forma rectangulo                  
      //                   minimumSize: Size(60, 30), 
      //                 ),
      //               ),
      //               ElevatedButton(
      //                 onPressed: () {
      //                 },
      //                 child: Text('Huecos', style: TextStyle(fontSize: 15, color: Colors.white)),
      //                 style: ElevatedButton.styleFrom(
      //                   backgroundColor: Color.fromARGB(255, 77, 185, 69), 
      //                   shape: RoundedRectangleBorder(),// forma rectangulo                  
      //                   minimumSize: Size(60, 30), 
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //         Positioned(
      //           right: 44,
      //           bottom: 8.5,
      //           child: Container( // Botón flotante pequeño
      //             width: 30, 
      //             height: 30, 
      //             child: Icon(Icons.swap_vert, size: 18, color: Colors.white,), 
      //             decoration: BoxDecoration(
      //               shape: BoxShape.rectangle, 
      //               color: Colors.green, 
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //     // CUADRO DE LAS PISTAS
      //     // GestureDetector( // meto el cuadro pistas dentro de esto, para poder tener un OnTap
      //     //   onTap: () {
      //     //     Navigator.push(
      //     //       context,
      //     //       MaterialPageRoute(builder: (context) => PaginasInfoPistas()),
      //     //     );
      //     //   },
      //       //child: 
      //       ListView.builder(
      //             itemCount: 3,
      //               itemBuilder: (context,index){
      //                 return 
      //                 cuadroPistas(centro: "Centro ", lugar: "Calle dsel padel", hora: "11:00", fecha: "05/03/2024", ocupados: 3);
      //               }),
      //       // FutureBuilder(
      //       //   future: pista.getPistas(true),
      //       //   builder: (context, AsyncSnapshot<List<Pista>> snapshot) {
      //       //     if(snapshot.hasData){
      //       //       print(snapshot.data!.length);
      //       //       return ListView.builder(
      //       //         //itemCount: snapshot.data!.length,
      //       //         itemCount: 3,
      //       //         itemBuilder: (context,index){
      //       //           return cuadroPistas(centro: "Centro ", lugar: "Calle dsel padel", hora: "11:00", fecha: "05/03/2024", ocupados: 3);
      //       //           //return cuadroPistas(centro: "Centro "+ index.toString(), lugar: snapshot.data![index].direccion, hora: snapshot.data![index].hora, fecha: snapshot.data![index].fecha.toString(), ocupados: snapshot.data![index].jugadores);
      //       //         });
      //       //     }
      //       //     else{
      //       //       return Center(child: Text("cargando"),);
      //       //     }
      //       //   },

      //       // )
      // //    ),
      // ],
      // ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 77, 185, 69), 
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PaginaCrearPistas())).then((value) {
            setState(() {});
          });
        }, 
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BarraNavegacion(key: UniqueKey(),selectedIndex:0),
      backgroundColor: Color.fromARGB(255, 203, 216, 203),
    );
  }
}
