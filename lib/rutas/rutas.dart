import 'package:flutter/material.dart';
import 'package:padel_proyecto/paginas/pagina_pistas.dart';
import 'package:padel_proyecto/paginas/pagina_principal.dart';
import 'package:padel_proyecto/paginas/paginas_mis_reservas.dart';

List menuOptions =<_ruta>[
  _ruta(Icons.person, 'Perfil', PaginaPistas()),
  _ruta(Icons.settings, 'Configuracion', PaginasMisReservas()),
  _ruta(Icons.dark_mode, 'Modo oscuro', PaginasMisReservas()),
  _ruta(Icons.help, 'Ayuda', PaginasMisReservas()),
];
class _ruta {
  final IconData icono;
  final String titulo;
  final Widget pagina;
  _ruta(this.icono,this.titulo,this.pagina);
}