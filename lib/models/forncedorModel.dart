import 'dart:io';

final String idColuna = 'idColuna';
final String nomeColuna = 'nomeColuna';
final String cpfCnpjColuna = 'cpfCnpjColuna';
final String ruaColuna = 'ruaColuna';
final String bairroColuna = 'bairroColuna';
final String cidadeColuna = 'cidadeColuna';
final String cepColuna = 'cepColuna';
final String estadoColuna = 'estadoColuna';
final String telefoneColuna = 'telefoneColuna';
final String horarioFuncionamentoColuna = 'horarioFuncionamentoColuna';
final String emailColuna = 'emailColuna';
final String senhaColuna = 'senhaColuna';
final String formaDePagamentoColuna = 'formaDePagamentoColuna';
final String fomadeCompraColuna = 'fomadeCompraColuna';
final String imagemColuna = 'imagemColuna';
final String imagemBase64Coluna = 'imagemBase64Coluna';

class FornecedorModel {
  String id;
  String nome;
  String cpfCnpj;
  String rua;
  String bairro;
  String cidade;
  String cep;
  String estado;
  String telefone;
  String horarioFuncionamento;
  String email;
  String senha;
  String formaDePagamento;
  String fomadeCompra;

  String imagem;
  String imagemBase64;

  FornecedorModel();
  void salvaFornecedor(FornecedorModel fornecedor) {
    print('Salva Forncedor: ${fornecedor.nome} - ${fornecedor.imagem}');
    print('Base64 - ${fornecedor.imagemBase64}');
  }

  Map toMap() {
    Map<String, dynamic> map = {
      nomeColuna: nome,
      cpfCnpjColuna: cpfCnpj,
      ruaColuna: rua,
      bairroColuna: bairro,
      cidadeColuna: cidade,
      cepColuna: cep,
      estadoColuna: estado,
      telefoneColuna: telefone,
      horarioFuncionamentoColuna: horarioFuncionamento,
      emailColuna: email,
      senhaColuna: senha,
      formaDePagamentoColuna: formaDePagamento,
      fomadeCompraColuna: fomadeCompra,
    };
    if (id != null) {
      map[idColuna] = id;
    }

    if (imagemBase64 != null) {
      map[imagemBase64Coluna] = imagemBase64;
    }
    return map;
  }

  FornecedorModel fromMap (Map map) {
    FornecedorModel fornecedorModel = FornecedorModel();
    fornecedorModel.nome = map[nomeColuna];
    fornecedorModel.cpfCnpj = map[cpfCnpjColuna];
    fornecedorModel.rua = map[ruaColuna];
    fornecedorModel.bairro = map[bairroColuna];
    fornecedorModel.cidade = map[cidadeColuna];
    fornecedorModel.cep = map[cepColuna];
    fornecedorModel.estado = map[estadoColuna];
    fornecedorModel.telefone = map[telefoneColuna];
    fornecedorModel.horarioFuncionamento = map[horarioFuncionamentoColuna];
    fornecedorModel.email = map[emailColuna];
    fornecedorModel.senha = map[senhaColuna];
    fornecedorModel.formaDePagamento = map[formaDePagamentoColuna];
    fornecedorModel.fomadeCompra = map[fomadeCompraColuna];
    fornecedorModel.id = map[idColuna];
    return fornecedorModel;
  }
}
