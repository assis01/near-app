import 'package:flutter/material.dart';
import 'package:near/database/dao/cliente_dao.dart';
import 'package:near/screens/Home/fluxo.dart';

import 'screens/cliente/cadastro_vendedor.dart';

void main() => runApp(NearApp());

class NearApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue[900],
        accentColor: Colors.blueGrey[50],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blue[900],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Fluxo(),
    );
  }
}
