


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:near/database/dao/cliente_dao.dart';

import 'package:near/models/cliente.dart';
import 'package:near/screens/home/tipo_cliente.dart';

class Fluxo extends StatelessWidget {
   final ClienteDao daoCliente = ClienteDao();

 
  @override
  Widget build(BuildContext context) {
  Future<List<Cliente>>lst=  daoCliente.findAll();

lst.then((teste){
debugPrint('${teste}');
  return TipoCliente().build(context);

});

  debugPrint('ok');
   return  Scaffold(
      
                     body: Padding(
                                   padding: const EdgeInsets.all(16.0),
                                   child: Center(child: Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Image.asset('images/near_fluxo.png'),
          ),),
    )
    );
  }
  
}