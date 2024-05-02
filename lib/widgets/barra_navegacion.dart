import 'package:flutter/material.dart';
import 'package:padel_proyecto/rutas/rutas.dart';

class barraNavegacion extends StatelessWidget {
  const barraNavegacion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.sports_tennis),
          label: 'Reservar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'Mis Reservas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment_outlined),
          label: 'Historial',
        ),
      ],
      selectedItemColor: Colors.green, 
    );
  }
}