
import 'package:flutter/cupertino.dart';
import 'package:near/models/cliente.dart';
import 'package:sqflite/sqflite.dart';
import 'package:near/database/app_database.dart';

class ClienteDao {

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_nome TEXT)';
  static const String _tableName = 'cliente';
  static const String _id = 'id';
  static const String _nome = 'nome';


  Future<int> save(Cliente cliente) async {
    final Database db = await getDatabase();
    Map<String, dynamic> clienteMap = _toMap(cliente);
    return db.insert(_tableName, clienteMap);
  }

  Future<List<Cliente>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);

    List<Cliente> clientes = _toList(result);
    return clientes;
  }

  Map<String, dynamic> _toMap(Cliente cliente) {
    final Map<String, dynamic> clienteMap = Map();
    clienteMap[_nome] = cliente.nome;
    return clienteMap;
  }

  List<Cliente> _toList(List<Map<String, dynamic>> result) {
    final List<Cliente> clientes = List();
    for (Map<String, dynamic> row in result) {
      final Cliente cliente = Cliente(
        row[_id],
        row[_nome],
      );
      clientes.add(cliente);
    }
    return clientes;
  }
}