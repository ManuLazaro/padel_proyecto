import 'package:flutter/material.dart';
import 'package:padel_proyecto/paginas/pagina_historial.dart';
import 'package:padel_proyecto/paginas/pagina_inicio_sesion.dart';
import 'package:padel_proyecto/paginas/pagina_principal.dart';
import 'package:padel_proyecto/paginas/paginas_mis_reservas.dart';

List menuOptions =<_ruta>[
  _ruta(Icons.person, 'Perfil', PaginaPistasHistorial()),
  _ruta(Icons.settings, 'Configuracion', PaginasMisReservas()),
  _ruta(Icons.dark_mode, 'Modo oscuro', PaginasMisReservas()),
  _ruta(Icons.help, 'Ayuda', PaginasMisReservas()),
  _ruta(Icons.exit_to_app, 'Salir', PaginaInicioSesion()),
];
class _ruta {
  final IconData icono;
  final String titulo;
  final Widget pagina;
  _ruta(this.icono,this.titulo,this.pagina);
}