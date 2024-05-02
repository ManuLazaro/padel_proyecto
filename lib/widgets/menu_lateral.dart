import 'package:flutter/material.dart';
import 'package:padel_proyecto/rutas/rutas.dart';

class menuLateral extends StatelessWidget {
  const menuLateral({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Text('Opciones',
               style: TextStyle(fontSize: 40,color: Colors.black),)),
            ),
          Expanded(
            child: ListView.separated(
              itemCount: menuOptions.length, 
              itemBuilder: (context, index) => ListTile(
                leading: Icon(
                  menuOptions[index].icono
                ),
                title: Text(menuOptions[index].titulo),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context ) => menuOptions[index].pagina)
                  );
                },
              ), 
              separatorBuilder: (context, index) => Divider(
                color: Colors.black,
              )
    
            ),
          )
        ],
      ),
    );
  }
}
