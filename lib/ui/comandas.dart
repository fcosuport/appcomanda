import 'dart:convert';
import 'package:appcomanda/model/comandas.dart';
import 'package:appcomanda/request/requests.dart';
import 'package:appcomanda/ui/grupos.dart';
import 'package:appcomanda/ui/itenscomanda.dart';
import 'package:flutter/material.dart';
//import 'package:http/http.dart';

class ComandasTela extends StatefulWidget {
  @override
  _ComandasTelaState createState() => _ComandasTelaState();
}

class _ComandasTelaState extends State<ComandasTela> {
  var listacomandas = new List<ListaComandas>();

  _getListaComandas() {
    Requests.getListaComandas().then((response) {
      setState(() {
        Iterable lista = json.decode(response.body);
        listacomandas =
            lista.map((model) => ListaComandas.fromJson(model)).toList();
      });
    });
  }

  _ComandasTelaState() {
    _getListaComandas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Listagem de Comandas'),
          centerTitle: true,
        ),
        body: listagem());
  }

  listagem() {
    return ListView.builder(
        itemCount: listacomandas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(listacomandas[index].numero),
            subtitle: Text(listacomandas[index].descricao),
            trailing: Icon(Icons.arrow_forward_ios),
            leading: CircleAvatar(
              backgroundColor: listacomandas[index].status == 'OCUPADA'
                  ? Colors.red
                  : Colors.green,
            ),
            onTap: () {
              if (listacomandas[index].status == 'OCUPADA') {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ItensComandaTela()));
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GruposTela()));
              }
            },
          );
        });
  }
}
