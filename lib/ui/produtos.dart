import 'dart:convert';
import 'package:appcomanda/model/produtos.dart';
import 'package:appcomanda/request/requests.dart';
import 'package:appcomanda/utils/arguments.dart';
import 'package:flutter/material.dart';

class ProdutosTela extends StatefulWidget {
  @override
  _ProdutosTelaState createState() => _ProdutosTelaState();
}

class _ProdutosTelaState extends State<ProdutosTela> {
  List<ListaProdutos> listaprodutos = new List<ListaProdutos>();
  String _nome;

  @override
  Widget build(BuildContext context) {
    final ProdutosArguments args = ModalRoute.of(context).settings.arguments;

    setState(() {
      _nome = args.nome;
      Requests.getListaProdutos(args.grupo).then((response) {
        setState(() {
          listaprodutos = new List<ListaProdutos>();
          Iterable lista = json.decode(response.body);
          listaprodutos =
              lista.map((model) => ListaProdutos.fromJson(model)).toList();
        });
      });
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(_nome),
        centerTitle: true,
      ),
      body: ListView.builder(
          //shrinkWrap: true,
          itemCount: listaprodutos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                listaprodutos[index].descricao,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'R\$${double.parse(listaprodutos[index].prvenda).toStringAsFixed(2).replaceAll('.', ',')}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                  //fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, '/inserirProduto');
              },
            );
          }),
    );
  }
}
