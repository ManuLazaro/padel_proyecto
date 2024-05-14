import 'package:flutter/material.dart';
import 'package:padel_proyecto/paginas/pagina_principal.dart';
import 'package:padel_proyecto/provider/datos_usuario.dart';
import 'package:provider/provider.dart';

import 'paginas/pagina_crear_gestor.dart';
import 'paginas/pagina_crear_jugador.dart';
import 'paginas/pagina_crear_pistas.dart';
import 'paginas/pagina_eleccion.dart';
import 'paginas/pagina_historial.dart';
import 'paginas/pagina_info_pistas.dart';
import 'paginas/pagina_inicio_sesion.dart';
import 'paginas/paginas_mis_reservas.dart';


void main() {
  runApp(
    MultiProvider(
      providers:[ 
        ChangeNotifierProvider(
        create:(_) => DatosUsuario()),
      ],
      child: const MyApp(),
    )
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final datosUsuario = Provider.of<DatosUsuario>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: const PaginaInicioSesion(),
    );
  }
}
