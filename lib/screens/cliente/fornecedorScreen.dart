import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:near/database/dao/cliente_dao.dart';
import 'package:near/models/cliente.dart';
import 'dart:io';
import 'dart:convert';

import 'package:near/models/forncedorModel.dart';
import 'package:near/screens/fornecedor/widgetPersonalizados.dart';
import 'package:near/screens/home/fluxo.dart';


class FornecedorScreen extends StatefulWidget {
  final FornecedorModel fornecedorModel;

  FornecedorScreen({this.fornecedorModel});
  @override
  _FornecedorScreenState createState() => _FornecedorScreenState();
}

class _FornecedorScreenState extends State<FornecedorScreen> {

  FornecedorModel _fornecedorModel = FornecedorModel();
  String _imageFile;

  TextEditingController controllerImagem = TextEditingController();
  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerCNPJ = TextEditingController();
  TextEditingController controllerRua= TextEditingController();
  TextEditingController controllerBairro= TextEditingController();
  TextEditingController controllerCidade= TextEditingController();
  TextEditingController controllerCep= TextEditingController();
  TextEditingController controllerEstado= TextEditingController();
  TextEditingController controllerTelefone= TextEditingController();
  TextEditingController controllerHorarioFuncionamento= TextEditingController();
  TextEditingController controllerEMail= TextEditingController();
  TextEditingController controllerSenha= TextEditingController();
  TextEditingController controllerFormaPagamento= TextEditingController();
  TextEditingController controllerFormaCompra= TextEditingController();

  File imageFile;

  var maskTextInputFormatterTelefone = MaskTextInputFormatter(mask: "(##) #####-####", filter: { "#": RegExp(r'[0-9]') });
  var maskTextInputFormatterCep = MaskTextInputFormatter(mask: "#####-###", filter: { "#": RegExp(r'[0-9]') });

  var maskTextInputFormatterCNPJ = MaskTextInputFormatter(mask: "##.###.###/####-##", filter: { "#": RegExp(r'[0-9]') });

  salvarDadosFornecedor() {
    _fornecedorModel.nome = controllerNome.text;
    _fornecedorModel.cpfCnpj = controllerCNPJ.text;
    _fornecedorModel.rua = controllerRua.text;
    _fornecedorModel.bairro = controllerBairro.text;
    _fornecedorModel.cidade = controllerCidade.text;
    _fornecedorModel.cep = controllerCep.text;
    _fornecedorModel.estado = controllerEstado.text;
    _fornecedorModel.telefone = controllerTelefone.text;
    _fornecedorModel.horarioFuncionamento = controllerHorarioFuncionamento.text;
    _fornecedorModel.email = controllerEMail.text;
    _fornecedorModel.senha = controllerSenha.text;
    _fornecedorModel.formaDePagamento = controllerFormaPagamento.text;
    _fornecedorModel.fomadeCompra = controllerFormaCompra.text;
    _fornecedorModel.imagem = _imageFile;

    print('CNPJ: ${_fornecedorModel.fromMap(_fornecedorModel.toMap())}');
    if (_imageFile != null && _imageFile.isNotEmpty) {
      imageFile = new File(_imageFile.toString());
      _fornecedorModel.imagemBase64 = base64Encode(imageFile.readAsBytesSync());
      _fornecedorModel.salvaFornecedor(_fornecedorModel);


        final ClienteDao _dao = ClienteDao();

            final Cliente newContact = Cliente(
                0,
                _fornecedorModel.nome,
                _fornecedorModel.cpfCnpj,
                _fornecedorModel.rua,
                _fornecedorModel.bairro,
                _fornecedorModel.cidade,
                _fornecedorModel.cep,
                _fornecedorModel.estado,
                _fornecedorModel.telefone,
                _fornecedorModel.horarioFuncionamento,
                _fornecedorModel.formaDePagamento,
                _fornecedorModel.fomadeCompra
            );
            _dao
                .save(newContact)
                .then(
                    (id) => Navigator.of(context).push(MaterialPageRoute(builder : (context) => Fluxo(),))
                );

    }
  }
@override
    void initState(){
      super.initState();

      if(widget.fornecedorModel == null){
        _fornecedorModel = FornecedorModel();
        print("Passou nulo");
      } else {
        _fornecedorModel = _fornecedorModel.fromMap(widget.fornecedorModel.toMap());
        print("Passou Valor");
        controllerNome.text=_fornecedorModel.nome;
        controllerCNPJ.text=_fornecedorModel.cpfCnpj;
        controllerRua.text=_fornecedorModel.rua;
        controllerBairro.text=_fornecedorModel.bairro;
        controllerCidade .text=_fornecedorModel.cidade;
        controllerCep.text=_fornecedorModel.cep;
        controllerEstado.text=_fornecedorModel.estado;
        controllerTelefone.text=_fornecedorModel.telefone;
        controllerHorarioFuncionamento.text=_fornecedorModel.horarioFuncionamento;
        controllerEMail.text=_fornecedorModel.email;
        controllerSenha.text=_fornecedorModel.senha;
        controllerFormaPagamento.text=_fornecedorModel.formaDePagamento;
        controllerFormaCompra.text=_fornecedorModel.fomadeCompra;
        controllerImagem.text=_fornecedorModel.imagem;
      }
    }

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Color.fromARGB(255, 245, 245, 245),
      child: Padding(
        padding: EdgeInsets.only(top:10.0),
        child: SingleChildScrollView(
          child:  Column(
            children: <Widget>[

              Padding (
                  padding: EdgeInsets.only(top: 20.0),
                  child: Card(

                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(_fornecedorModel.id == null?'Cadastro':'Minha Conta',
                                style: TextStyle(
                                    fontSize: 25.0,
                                    color:
                                    Color(int.parse('0xff335578')))
                            ),
                          ),
                        ),
                        PaddingPersonalizado(
                            GestureDetector(

                              onTap: ()  {
                                Navigator.pop(context);

                              },
                              child: Text('Voltar',
                                  style: TextStyle(
                                      fontSize: 25.0, color: Colors.grey)
                              ),
                            )
                        ),
                      ],
                    ),
                  )
              ),

              Padding (
                  padding: EdgeInsets.only(top: 10.0),
                  child: Card(

                    child: Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(10.0),
                            child: _imageFile==null?FotoCirdular('images/Perfil-Psicologico.jpg',80.0,80.0)
                            :Container(
                                width: 80.0,
                                height: 80.0,
                                decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                        fit: BoxFit.fill, image: FileImage(File(_imageFile))))),
                        ),
                GestureDetector(
                  onTap: () {

                    ImagePicker.pickImage(source: ImageSource.camera).then((file){
                      if(file.path == null){
                        return null;
                      }
                      setState(() {
                        _imageFile = file.path;
                      });

                    });

                    print("Container clicked: ${_imageFile}");

                  },
                  child:Container(

                      color: Colors.transparent,
                      child: Text('Adicionar Foto'
                          , style: TextStyle(fontSize: 20.0,color: Colors.grey))
                  ),
                )

                        
                      ],
                    ),
                  )
              ),

              Padding (
                  padding: EdgeInsets.only(top: 20.0),
                  child: Card(
                    color: Color.fromARGB(255, 245, 245, 245),
                    child:
                    Form(
                      child: CamposFormularioFornecedor(),

                    )

                  )
              ),
            ],
          ),
        )

      ),
    );
  }
  Widget CamposFormularioFornecedor(){
    return  Column(
      children: <Widget>[

        TextFormFieldPersonalizado('Empresa',1,'Empresa',false,controllerNome),
        Padding(
            padding: EdgeInsets.all(3.0),
            child: Card(
              color: Colors.white,
              child: TextFormField(
                validator: (String valor){
                  if(valor == null || valor.isEmpty){
                    return 'Campo obrigatório.';
                  }
                  return null;
                },
                inputFormatters: [maskTextInputFormatterCNPJ],
                autocorrect: false,
                keyboardType: TextInputType.phone,
                decoration:
                InputDecoration(hintText: "99.999.999/9999-99",
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                  labelText: 'CNPJ',
                ),
                controller: controllerCNPJ,
                maxLines: 1,
              ),
            )
        ),

        TextFormFieldPersonalizado('E-Mail',1,'E-Mail',false,controllerEMail),
        TextFormFieldPersonalizado('Senha',1,'Senha',false,controllerSenha),
        Padding(
            padding: EdgeInsets.all(3.0),
            child: Card(
              color: Colors.white,
              child: TextFormField(
                validator: (String valor){
                  if(valor == null || valor.isEmpty){
                    return 'Campo obrigatório.';
                  }
                  return null;
                },
                inputFormatters: [maskTextInputFormatterTelefone],
                autocorrect: false,
                keyboardType: TextInputType.phone,
                decoration:
                InputDecoration(hintText: "99999-999",
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                  labelText: 'Telefone',
                ),
                controller: controllerTelefone,
                maxLines: 1,
              ),
            )
        ),
        TextFormFieldPersonalizado('Forma de Pagamento',1,'Forma de Pagamaneto',false,controllerFormaPagamento),
        TextFormFieldPersonalizado('Forma de compra',1,'Retira ou Entrega',false,controllerFormaCompra),
        Padding(
            padding: EdgeInsets.all(3.0),
            child: Card(
              color: Colors.white,
              child: TextFormField(
                validator: (String valor){
                  if(valor == null || valor.isEmpty){
                    return 'Campo obrigatório.';
                  }
                  return null;
                },
                inputFormatters: [maskTextInputFormatterCep],
                autocorrect: false,
                keyboardType: TextInputType.phone,
                decoration:
                InputDecoration(hintText: "99999-999",
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                  labelText: 'CEP',
                ),
                controller: controllerCep,
                maxLines: 1,
              ),
            )
        ),
        TextFormFieldPersonalizado('Rua',1,'Rua',false,controllerRua),
        TextFormFieldPersonalizado('Bairro',1,'Bairro',false,controllerBairro),
        TextFormFieldPersonalizado('Cidade',1,'Cidade',false,controllerCidade),

        TextFormFieldPersonalizado('Estado',1,'Estado',false,controllerEstado),

        TextFormFieldPersonalizado('Horario de funcionamento',1,'Horario de funcionamento'
            ,false,controllerHorarioFuncionamento),
        Divider(),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            color: Color(int.parse('0xff335578')),
            onPressed: () {
              salvarDadosFornecedor();
            },
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child:Text(_fornecedorModel.id == null?'Finalizar Cadastro':'Salvar'
                  ,
                  style: TextStyle(
                      color: Colors.white, fontSize: 20.0),
                ),
              ),

            ),
          ),
        ),

      ],
    );
  }
}




