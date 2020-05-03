import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:near/database/dao/cliente_dao.dart';
import 'package:near/models/cliente.dart';
import 'package:near/screens/home/fluxo.dart';

class CadastroForm extends StatefulWidget {
  @override
  _CadastroFormState createState() => _CadastroFormState();
}

class _CadastroFormState extends State<CadastroForm> {
  final TextEditingController _nomeController = TextEditingController();

  final ClienteDao _dao = ClienteDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro vendedor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(
                labelText: 'Nome da empresa',
              ),
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: RaisedButton(
                  child: Text('Create'),
                  onPressed: () {
                    final String name = _nomeController.text;
           
                   // final Cliente newContact = Cliente(0, name,);
                   // _dao.save(newContact).then((id) => Navigator.of(context).push(MaterialPageRoute(builder : (context) => Fluxo(),)));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
