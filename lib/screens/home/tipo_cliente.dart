


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:near/screens/home/fluxo.dart';

class TipoCliente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
                     body: Padding(
                                   padding: const EdgeInsets.fromLTRB(120.0,64.0,64.0,64.0),
                                   child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget>[
                                    Visibility(    child:Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Image.asset('images/near_fluxo.png'),
          ),),
            Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
              Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () =>  Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Fluxo(),
      ),
    ),
          child: Container(
            padding: EdgeInsets.all(8.0),
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
               
                Text(
                  'teste',
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
    )
              ],
            ),
          ),])),
    
    );
  }
  
}
