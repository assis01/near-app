

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:near/screens/cliente/cadastro_vendedor.dart';
import 'package:near/screens/cliente/fornecedorScreen.dart';


class TipoCliente extends StatefulWidget {

    @override _TipoClienteState createState() => _TipoClienteState();

}
class _TipoClienteState extends State<TipoCliente> {

    @override Widget build(BuildContext context) {
        return Scaffold(
    
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,

        
        children: <Widget>[
          Padding(
             padding: const EdgeInsets.fromLTRB(128.0,64.0,64.0,64.0),
            child: Image.asset('images/near_fluxo.png'),
          ),
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _ClienteBotao(
                  'Vendedor',
                  Icons.business,
                  onClick: () => _showClientePj(context),
                ),
                _ClienteBotao(
                  'Cliente',
                  Icons.people,
                  onClick: () => _showClientePj(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
        
        
        
        
        

  void _showClientePj(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FornecedorScreen(),
      ),
    );
  }
}
class _ClienteBotao extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function onClick;

  _ClienteBotao(
    this.name,
    this.icon, {
    @required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () => onClick(),
          child: Container(
            padding: EdgeInsets.all(8.0),
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  icon,
                  color: Colors.white,
                  size: 24.0,
                ),
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
