import 'package:flutter/material.dart';
import 'package:near/screens/fornecedor/widgetPersonalizados.dart';



Widget ListaHistorico(List listaHistorico) {
  return ListView.builder(
    itemCount: listaHistorico.length,
    itemBuilder: (context, index) {
      return itemHistorico(context, index, listaHistorico);
    },
  );
}

Widget itemHistorico(BuildContext context, int index, List listaHistorico) {
  return Card(
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(right: 10, top: 5.0),
              child: Text(
                listaHistorico[index]['Status'],
                style: TextStyle(color: listaHistorico[index]['Status']=='Finalizado'? Colors.green:Colors.red,
                     fontSize: 20),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              PaddingPersonalizado(
                  FotoQuadrado('images/Cadeira-Branca.jpg', 80.0, 80.0)),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    listaHistorico[index]['Nome Cliente'],
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "V${index}",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          ),
        ],
      ));
}