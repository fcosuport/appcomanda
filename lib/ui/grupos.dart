import 'dart:convert';
import 'package:appcomanda/model/grupos.dart';
import 'package:appcomanda/request/requests.dart';
import 'package:appcomanda/ui/produtos.dart';
import 'package:flutter/material.dart';

class GruposTela extends StatefulWidget {
  @override
  _GruposTelaState createState() => _GruposTelaState();
}

class _GruposTelaState extends State<GruposTela> {
  var listagrupos = new List<ListaGrupos>();

  _getListaGrupos() {
    Requests.getListaGrupos().then((response) {
      setState(() {
        Iterable lista = json.decode(response.body);
        listagrupos =
            lista.map((model) => ListaGrupos.fromJson(model)).toList();
      });
    });
  }

  _GruposTelaState() {
    _getListaGrupos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grupo de Produtos'),
        centerTitle: true,
      ),
      body: ListView.builder(
          //shrinkWrap: true,
          itemCount: listagrupos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                listagrupos[index].descricao,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              leading: Icon(Icons.fastfood, color: Colors.blue),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProdutosTela()));
              },
            );
          }),
    );
  }
}
