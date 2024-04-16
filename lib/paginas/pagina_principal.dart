import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:padel_proyecto/rutas/rutas.dart';
import 'package:padel_proyecto/widgets/menu_lateral.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PADEL', 
        style: TextStyle(
        color: Colors.blue  
        ),),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Colors.white
          ),
        ),
      ),
      drawer: menuLateral(),
      body: Container(
        padding: EdgeInsets.all(4.0),
        margin: EdgeInsets.all(8.0),
        height: 60,
        decoration: BoxDecoration(
          color:Colors.lime

        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [Text('lugar'),
                Text('hora')],
              ),
            ),
            Text('fecha'),
            SizedBox(width: 9),
            Container(
              width: 3,
              padding: EdgeInsets.symmetric(horizontal: 1),
              decoration: BoxDecoration(
                color: Colors.black
              ),
            ),
            SizedBox(width: 9),
            
            Container(

              color: Colors.grey,
              child: _huecosDisponibles()),
          ],
        ),
      ),
    ); 
  }

}

class _huecosDisponibles extends StatelessWidget {
  const _huecosDisponibles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        children: [
          Row(
            children: [
              _circuloMarcado(),
              _circuloMarcado()
            ],
          ),
          Row(
            children: [
              _circuloMarcado(),
              _circuloMarcado()
            ],
          ),
        ],
      ));
  }
}

class _circuloMarcado extends StatelessWidget {
  const _circuloMarcado({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.amber,
        
        
      ),
       
    );
  }
}

