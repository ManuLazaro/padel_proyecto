import 'package:flutter/material.dart';
import 'package:padel_proyecto/paginas/paginas_mis_reservas.dart';
import '../paginas/pagina_historial.dart';
import '../paginas/pagina_principal.dart';

class barraNavegacion extends StatefulWidget {
  const barraNavegacion({required Key key}) : super(key: key);

  @override
  State<barraNavegacion> createState() => _barraNavegacionState();
}

class _barraNavegacionState extends State<barraNavegacion> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      currentIndex: selectedIndex,
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
        setState(() {
          selectedIndex = index;
        });
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
