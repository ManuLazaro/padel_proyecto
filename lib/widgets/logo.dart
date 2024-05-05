import 'package:flutter/material.dart';

class PistaPadel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200, // Nuevo ancho de la pista
        height: 100, // Nuevo alto de la pista
        child: Stack(
          children: [
            // Línea de arriba
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: Container(
                height: 4,
                color: Colors.white,
              ),
            ),
            // Línea de abajo
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 4,
                color: Colors.white,
              ),
            ),
            // Línea izquierda 
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Container(
                width: 4,
                color: Colors.white,
              ),
            ),
            // Línea derecha 
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Container(
                width: 4,
                color: Colors.white,
              ),
            ),
            // Línea del centro
            Positioned(
              left: 100,
              top: 0,
              bottom: 0,
              child: Container(
                width: 4,
                color: Colors.white,
              ),
            ),
            // Línea de dentro izquierda
            Positioned(
              left: 30,
              top: 0,
              bottom: 0,
              child: Container(
                width: 2,
                color: Colors.white,
              ),
            ),
            // Línea de dentro derecha
            Positioned(
              left: 170,
              top: 0,
              bottom: 0,
              child: Container(
                width: 2,
                color: Colors.white,
              ),
            ),
            // Línea del centro horizontal
            Positioned(
              left: 30,
              right: 30,
              top: 50,
              child: Container(
                height: 2,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
