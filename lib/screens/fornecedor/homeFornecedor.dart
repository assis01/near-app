import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:near/models/forncedorModel.dart';
import 'package:near/screens/cliente/fornecedorScreen.dart';
import 'package:near/screens/fornecedor/listaHistorico.dart';
import 'package:near/screens/fornecedor/listaPedidos.dart';
import 'package:near/screens/fornecedor/listaProdutos.dart';
import 'package:near/screens/fornecedor/widgetPersonalizados.dart';



class HomeFornecedor extends StatefulWidget {
  final FornecedorModel fornecedorModel;
  HomeFornecedor({this.fornecedorModel});
  @override
  _HomeFornecedorState createState() => _HomeFornecedorState();
}

class _HomeFornecedorState extends State<HomeFornecedor> {
  int numeroPagina;
  bool _exibe;
  Color historicoColor = Colors.blueGrey;
  Color pedidosColor = Colors.blueGrey;
  Color produtosColor = Colors.blueGrey;

  Map<String,dynamic> dadosPididos = Map();

  List listaProdutosSearch = [];
  List listaProdutos = [
    {
    "Nome": "Cadeira Branca",
    "Status": "Disponível"
  },
    {
      "Nome": "Cadeira Rosa",
      "Status": "Indisponível"
    },
    {
      "Nome": "Cadeira Verde",
      "Status": "Disponível"
    },
    {
      "Nome": "Cadeira Preta",
      "Status": "Disponível"
    }];
  List listaHistorico = [
    {
  "Nome": "Cadeira Branca",
  "Status": "Finalizado",
  "Nome Cliente": "Siloe"
},
{
"Nome": "Cadeira Rosa",
"Status": "Recusado",
"Nome Cliente": "Leonardo"
},
{
"Nome": "Cadeira Verde",
"Status": "Finalizado",
"Nome Cliente": "Michael"
},
{
"Nome": "Cadeira Preta",
"Status": "Recusado",
"Nome Cliente": "Marina"
}
  ];
  TextEditingController filtroController = TextEditingController();
  List listaPedidos=[
    {
    "Nome": "Cadeira Branca",
    "Status": "Novo"
  },
    {
      "Nome": "Cadeira Rosa",
      "Status": "Em Andamento"
    },
    {
      "Nome": "Cadeira Verde",
      "Status": "Novo"
    },
    {
      "Nome": "Cadeira Preta",
      "Status": "Novo"
    }];
  FornecedorModel fornecedorModel = FornecedorModel();
  @override
  void initState() {
    super.initState();
    numeroPagina = 1;
    _exibe=false;
    pedidosColor = Color(int.parse('0xff335578'));
    listaProdutosSearch.addAll(listaProdutos);
         // Passa valor para testar Tela
         fornecedorModel.id="111";
         fornecedorModel.nome="Luciano";

  }

  void filterSearchResults(String query) {
    setState(() {
      listaProdutosSearch = listaProdutos.where((produto) => produto['Nome'].toLowerCase().contains(query.toLowerCase())).toList();
    });

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 245, 245, 245),
      child: Padding(
          padding: EdgeInsets.only(top: 5.0),
          child:
            Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child:
                    Card(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: PaddingPersonalizado(
                                  Text('Principal',
                                      style: TextStyle(
                                          fontSize: 25.0,
                                          color:
                                          Color(int.parse('0xff335578')))
                                  ),
                                ),
                              ),
                              PaddingPersonalizado(
                                  GestureDetector(

                                    onTap: ()async {
                                     Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => FornecedorScreen(fornecedorModel: fornecedorModel,)),
                                      );


                                    },
                                    child: Text('Editar',
                                        style: TextStyle(
                                            fontSize: 25.0, color: Colors.grey)
                                    ),
                                  )
                              ),

                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: FotoCirdular(
                                      'images/Perfil-Psicologico.jpg',
                                      80.0,
                                      80.0)),

                              Container(
                                  color: Colors.transparent,
                                  child: Text('Armarinhos Fernando',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.blueGrey))),

                            ],
                          ),

                          PaddingPersonalizado(
                            Row(
                              children: <Widget>[

                                 Expanded(child:
                                 GestureDetector(
                                   child: Text('Novos Pedidos',
                                     style: TextStyle(fontSize: 18,
                                         color:pedidosColor,
                                     ),
                                   ),
                                   onTap: (){
                                     setState(() {
                                       numeroPagina =1;
                                       historicoColor = Colors.blueGrey;
                                       pedidosColor = Color(int.parse('0xff335578'));
                                       produtosColor = Colors.blueGrey;
                                       _exibe=false;
                                     });
                                   },
                                 ),

                                 ),
                                Expanded(
                                    child:GestureDetector(
                                      child: Text('Histórico',style: TextStyle(fontSize: 18,color: historicoColor),),
                                      onTap: (){
                                        setState(() {
                                          numeroPagina =2;
                                          historicoColor = Color(int.parse('0xff335578'));
                                          pedidosColor = Colors.blueGrey;
                                          produtosColor = Colors.blueGrey;
                                          _exibe=false;
                                        });
                                      },
                                    ),

                                ),
                                GestureDetector(
                                  child: Text('Produtos',style: TextStyle(fontSize: 18, color: produtosColor),),
                                  onTap: (){
                                    setState(() {
                                      numeroPagina =3;
                                      historicoColor = Colors.blueGrey;
                                      pedidosColor = Colors.blueGrey;
                                      produtosColor = Color(int.parse('0xff335578'));
                                      _exibe=true;
                                      filterSearchResults(filtroController.text);
                                    });
                                  },
                                ),

                              ],
                            ),

                          ),

                          Padding(
                            padding: EdgeInsets.only(left:0.5),
                              child:
                              Visibility(
                                visible: _exibe,
                            child:
                                Row(
                                  children: <Widget>[

                                    Expanded(
                                        child: Container(
                                          height: 60,
                                          child: TextFieldPersonalizadoC('', 1, 'Ex: Cadeira', false,filtroController),

                                        ),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.search,color: Colors.blue,),
                                      onPressed: (){
                                        filterSearchResults(filtroController.text);
                                      },
                                    ),

                                    IconButton(
                                      icon: Icon(Icons.add,color: Colors.green,),
                                      onPressed: (){

                                      },
                                    )

                                  ],
                                )

                           ,
                          )
                          ),
                        ],
                      ),
                    )
                ),
                Expanded(child: Pagigas())
              ],
            ),
      ),
    );
  }
  Widget Pagigas() {
    switch (numeroPagina) {
      case 1:
        {
          return ListaPedidos(listaPedidos);
        }
      case 2:
        {
          return ListaHistorico(listaHistorico);
        }
      case 3:
        {
          return ListaProdutos(listaProdutosSearch);
        }

      default:
        {
          return Container(color: Colors.white);
        }
    }
  }
}


