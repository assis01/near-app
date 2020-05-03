import 'package:flutter/material.dart';
import 'package:near/screens/fornecedor/widgetPersonalizados.dart';



Widget ListaProdutos(List listaPedidos) {
  return ListView.builder(
    itemCount: listaPedidos.length,
    itemBuilder: (context, index) {
      return itemProdutos(context, index, listaPedidos);
    },
  );
}

Widget itemProdutos(BuildContext context, int index, List listaPedidos) {
  return Card(
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(right: 10, top: 5.0),
              child: Text(
                listaPedidos[index]['Status'],
                style: TextStyle(
                    color: listaPedidos[index]['Status']=='Disponível'? Colors.green:Colors.red,
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
                    listaPedidos[index]['Nome'],
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "#${index}",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          ),
        ],
      ));
}