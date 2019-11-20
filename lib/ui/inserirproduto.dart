import 'package:flutter/material.dart';
import '../utils/arguments.dart';

class InserirProdutoTela extends StatefulWidget {
  @override
  _InserirProdutoTelaState createState() => _InserirProdutoTelaState();
}

class _InserirProdutoTelaState extends State<InserirProdutoTela> {
  String _controle;
  String _descricao;

  @override
  Widget build(BuildContext context) {
    final InserirItemArguments args = ModalRoute.of(context).settings.arguments;

    setState(() {
      _controle = args.controle;
      _descricao = args.descricao;
    })

    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionando Produto'),
        centerTitle: true,
      ),
      //body:
    );
  }
}
