import 'package:flutter/material.dart';
import 'package:padel_proyecto/paginas/pagina_pistas.dart';
import 'package:padel_proyecto/paginas/pagina_principal.dart';
import 'package:padel_proyecto/paginas/paginas_mis_reservas.dart';

List menuOptions =<_ruta>[
  _ruta(Icons.access_time_filled_sharp, 'pistas', PaginaPistas()),
  _ruta(Icons.abc, 'mis reservas', PaginasMisReservas()),
];
class _ruta {
  final IconData icono;
  final String titulo;
  final Widget pagina;
  _ruta(this.icono,this.titulo,this.pagina);
}