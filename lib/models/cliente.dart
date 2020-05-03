class Cliente {
final int id;
final String nome;
final String cpfCnpj;
final String rua;
final String bairro;
final String cidade;
final String cep;
final String estado;
final String telefone;
final String horarioFuncionamento;
final String formaDePagamento;
final String fomadeCompra;


Cliente(
  this.id,
  this.nome,
  this.cpfCnpj,
  this.rua,
  this.bairro,
  this.cidade,
  this.cep,
  this.estado,
  this.telefone,
  this.horarioFuncionamento,
  this.formaDePagamento,
  this.fomadeCompra
);

@override
String toString() {
  return 'Cliente{id: $id, nome: $nome';
}

Cliente.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      nome = json['nome'],
      cpfCnpj = json['cpfCnpj'],
      rua = json['rua'],
      bairro = json['bairro'],
      cidade = json['cidade'],
      cep = json['cep'],
      estado = json['estado'],
      telefone = json['telefone'],
      horarioFuncionamento = json['horarioFuncionamento'],
      formaDePagamento = json['formaDePagamento'],
      fomadeCompra = json['fomadeCompra'];
      

Map<String, dynamic> toJson() =>
    {
        'id': id,
      'nome': nome,
      'cpfCnpj': cpfCnpj,
      'rua': rua,
      'cidade': cidade,
      'cep': cep,
      'estado': estado,
      'telefone': telefone,
      'horarioFuncionamento': horarioFuncionamento,
      'formaDePagamento': formaDePagamento,
      'fomadeCompra': fomadeCompra
    
    };
}
