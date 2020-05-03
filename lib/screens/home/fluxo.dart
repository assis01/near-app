import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:near/components/progress.dart';
import 'package:near/database/dao/cliente_dao.dart';
import 'package:near/models/cliente.dart';
import 'package:near/screens/cliente/cadastro_vendedor.dart';
import 'package:near/screens/fornecedor/homeFornecedor.dart';
import 'package:near/screens/home/tipo_cliente.dart';


import 'principal.dart';

class Fluxo extends StatefulWidget {

    @override State<StatefulWidget> createState() {
        return FluxoStale();
    }

}

class FluxoStale extends State<Fluxo> {

    @override Widget build(BuildContext context) {

        final ClienteDao _dao = ClienteDao();

        return FutureBuilder<List<Cliente>>(future : _dao.findAll(), 
        builder : (context,
            snapshot
        ) {
            switch(snapshot.connectionState) {
                case ConnectionState.none:
                    break;
                case ConnectionState.waiting:
                    return Progress();
                    break;
                case ConnectionState.active:
                    break;
                case ConnectionState.done:

                    if (snapshot.hasData) {
                        final List<Cliente> clientes = snapshot.data;

                        if (clientes.isNotEmpty && clientes.length > 0) {
                            debugPrint('clientes >>>>>done');
                            return HomeFornecedor();
                        }
                    }
                     debugPrint('clientes >>>>>default');
                     return TipoCliente();
              break;
            }
        });

    }
}

class Padrao extends StatelessWidget {

    @override Widget build(BuildContext context) {
        return Scaffold(
                    body : Padding(padding : const EdgeInsets.fromLTRB(120.0, 64.0, 64.0, 64.0), child : Column(
                        crossAxisAlignment : CrossAxisAlignment.start,
                        children : <Widget> [Visibility(child : Padding(
                                padding : const EdgeInsets.all(8.0),
                                child : Image.network('images/near_fluxo.png'),
                            ),)]
                    )),

                );
            }
        }
