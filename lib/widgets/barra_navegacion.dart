import 'package:flutter/material.dart';
import 'package:padel_proyecto/paginas/paginas_mis_reservas.dart';
import '../paginas/pagina_historial.dart';
import '../paginas/pagina_principal.dart';


class BarraNavegacion extends StatelessWidget {
  const BarraNavegacion({super.key, this.selectedIndex =0});
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      currentIndex: this.selectedIndex,
      items:  <BottomNavigationBarItem>[
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
      unselectedItemColor: Colors.grey[700], 
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PaginaPrincipal()));
            break;
          case 1:
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PaginasMisReservas()));
            break;
          case 2:
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PaginaPistasHistorial()));
            break;
        }
      },
    );
  }
}

