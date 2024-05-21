import 'package:flutter/material.dart';
import 'package:padel_proyecto/rutas/rutas.dart';
import 'package:provider/provider.dart';

import '../provider/datos_usuario.dart';

class menuLateral extends StatelessWidget {
  const menuLateral({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final datos = Provider.of<Datos>(context);
    String nombre = datos.usuarioActual.nombre;

    return Drawer(
      child: Column(
        children: [
          Container(
            width: 330,
            color: Colors.green,
            padding: EdgeInsets.only(left: 20, top: 40, bottom: 20),
            child: Column(
              //COLUMNA CON TODO
              children: [
                // ENCABEZADO
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    color: Colors.green,
                    size: 40,
                  ),
                  radius: 30,
                ),
                SizedBox(height: 10),
                Text( // NOMBRE DEL USUARIO QUE INICIE SESION
                  nombre,
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded( // EXPANDED con todas las opciones
            child: ListView.separated(
              itemCount: menuOptions.length,
              itemBuilder: (context, index) => ListTile(
                leading: Icon(menuOptions[index].icono),
                title: Text(menuOptions[index].titulo),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => menuOptions[index].pagina),
                  );
                },
              ),
              separatorBuilder: (context, index) => Divider(
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
