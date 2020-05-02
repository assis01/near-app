class Cliente {
final int id;
final String nome;

Cliente(
  this.id,
  this.nome,

);

@override
String toString() {
  return 'Cliente{id: $id, nome: $nome';
}

Cliente.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      nome = json['nome'];

Map<String, dynamic> toJson() =>
    {
        'id': id,
      'nome': nome,
    
    };
}
