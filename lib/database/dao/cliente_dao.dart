import 'package:flutter/cupertino.dart';
import 'package:near/models/cliente.dart';
import 'package:sqflite/sqflite.dart';
import 'package:near/database/app_database.dart';

class ClienteDao {

    static const String tableSql = 'CREATE TABLE $_tableName(' '$_id INTEGER PRIMARY KEY, ' '$_nome TEXT, $_cpfCnpj TEXT    , $_rua TEXT, $_bairro TEXT, $_cidade TEXT, $_cep TEXT, $_estado TEXT, $_telefone TEXT, $_horarioFuncionamento TEXT, $_formaDePagamento TEXT, $_fomadeCompra TEXT)';

    static const String _tableName = 'cliente';
    static const String _id = 'id';
    static const String _nome = 'nome';
     static const String  _cpfCnpj= 'cpfCnpj';
 static const String  _rua= 'rua';
 static const String  _bairro= 'bairro';
 static const String  _cidade= 'cidade';
 static const String  _cep= 'cep';
 static const String  _estado= 'estado';
 static const String  _telefone= 'telefone';
 static const String  _horarioFuncionamento= 'horarioFuncionamento';
 static const String  _formaDePagamento= 'formaDePagamento';
 static const String  _fomadeCompra= 'fomadeCompra';

    Future<int> save(Cliente cliente)async {
        final Database db = await getDatabase();
        Map<String, dynamic> clienteMap = _toMap(cliente);
        return db.insert(_tableName, clienteMap);
    }

    Future<List<Cliente>> findAll()async {
        final Database db = await getDatabase();
        final List<Map<String, dynamic>> result = await db.query(_tableName);

        List<Cliente> clientes = _toList(result);
        return clientes;
    }


     Future<int> count()async {
        final Database db = await getDatabase();
        final List<Map<String, dynamic>> result = await db.query(_tableName);

        List<Cliente> clientes = _toList(result);
        return clientes.length;
    }

    Future<int> delele(String id)async {
        final Database db = await getDatabase();
        return db.delete(_tableName, where : '$_id = ?', whereArgs : [id]);
    }

    Future<int> update(Cliente cliente)async {
        final Database db = await getDatabase();
        Map<String, dynamic> clienteMap = _toMap(cliente);
        return await db.update(
            _tableName,
            clienteMap,
            where : '$_id = ?',
            whereArgs : [cliente.id]
        );
    }

    Map<String, dynamic> _toMap(Cliente cliente) {
        final Map<String, dynamic> clienteMap = Map();
        clienteMap[_nome] = cliente.nome;
        clienteMap[_cpfCnpj] = cliente.cpfCnpj;
        clienteMap[_rua] = cliente.rua;
        clienteMap[_bairro] = cliente.bairro;
        clienteMap[_cidade] = cliente.cidade;
        clienteMap[_cep] = cliente.cep;
        clienteMap[_estado] = cliente.estado;
        clienteMap[_telefone] = cliente.telefone;
        clienteMap[_horarioFuncionamento] = cliente.horarioFuncionamento;
        clienteMap[_formaDePagamento] = cliente.formaDePagamento;
        clienteMap[_fomadeCompra] = cliente.fomadeCompra;


       
        return clienteMap;
    }

    List<Cliente> _toList(List<Map<String, dynamic>> result) {
        final List<Cliente> clientes = List();
        for (Map<String, dynamic> row in result) {
            final Cliente cliente = Cliente(
              row[_id], 
              row[_nome],
              row[_cpfCnpj],
               row[_rua],
              row[_bairro],
              row[_cidade],
              row[_cep],
              row[_estado],
              row[_telefone],
              row[_horarioFuncionamento],
              row[_formaDePagamento],
              row[_fomadeCompra]);
            clientes.add(cliente);
        }
        return clientes;
    }
}