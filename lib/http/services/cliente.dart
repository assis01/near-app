import 'dart:convert';


import 'package:http/http.dart';
import 'package:near/models/cliente.dart';

import '../webclient.dart';

class ClienteService {



  final String _path_lista = 'cliente/listar';
  final String _path_salvar = 'cliente/salvar';

  Future<List<Cliente>> findAll() async{
    final Response response =
        await client.get(api_host+_path_lista,
        headers: {
          'Content-type': 'application/json',
          'x-api-key': x_api_key,
        });
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic json) => Cliente.fromJson(json))
        .toList();
  }

  Future<Cliente> save(Cliente transaction, String password) async {
    final String transactionJson = jsonEncode(transaction.toJson());

    await Future.delayed(Duration(seconds: 2));

    final Response response = await client.post(api_host+_path_salvar,
        headers: {
          'Content-type': 'application/json',
          'x-api-key': x_api_key,
        },
        body: transactionJson);

    if (response.statusCode == 200) {
      return Cliente.fromJson(jsonDecode(response.body));
    }

    throw HttpException(_getMessage(response.statusCode));
  }

  String _getMessage(int statusCode) {
    if(_statusCodeResponses.containsKey(statusCode)){
      return _statusCodeResponses[statusCode];
    }
    return 'unknown error';
  }

  static final Map<int, String> _statusCodeResponses = {
    400: 'there was an error submitting transaction',
    401: 'authentication failed',
    409: 'transaction already exists'
  };
}

class HttpException implements Exception {
  final String message;

  HttpException(this.message);
}
