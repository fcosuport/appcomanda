import 'dart:convert';
import 'package:appcomanda/model/produtos.dart';
import 'package:appcomanda/request/requests.dart';
import 'package:appcomanda/ui/inserirproduto.dart';
import 'package:flutter/material.dart';

class ProdutosTela extends StatefulWidget {
  @override
  _ProdutosTelaState createState() => _ProdutosTelaState();
}

class _ProdutosTelaState extends State<ProdutosTela> {
  var listaprodutos = new List<ListaProdutos>();

  _getListaProdutos() {
    Requests.getListaProdutos().then((response) {
      setState(() {
        Iterable lista = json.decode(response.body);
        listaprodutos =
            lista.map((model) => ListaProdutos.fromJson(model)).toList();
      });
    });
  }

  _ProdutosTelaState() {
    _getListaProdutos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tapiocas diversas'),
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
                listaprodutos[index].prvenda,
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
