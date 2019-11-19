import 'dart:convert';
import 'package:appcomanda/model/comandas.dart';
import 'package:appcomanda/request/requests.dart';
import 'package:appcomanda/ui/itenscomanda.dart';
import 'package:appcomanda/utils/arguments.dart';
import 'package:flutter/material.dart';

class ComandasTela extends StatefulWidget {
  @override
  _ComandasTelaState createState() => _ComandasTelaState();
}

class _ComandasTelaState extends State<ComandasTela> {
  List<ListaComandas> listacomandas = new List<ListaComandas>();

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
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.pushNamed(context, '/configuracoes');
              },
            )
          ],
        ),
        body: listagem());
  }

  listagem() {
    return ListView.builder(
        itemCount: listacomandas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              listacomandas[index].numero,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(listacomandas[index].descricao +
                ' ' +
                listacomandas[index].status),
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
                        builder: (context) => ItensComandaTela(),
                        settings: RouteSettings(
                            arguments: ItensComandaArguments(
                                listacomandas[index].numpedido,
                                listacomandas[index].descricao))));
              } else {
                Navigator.pushNamed(context, '/grupos');
              }
            },
          );
        });
  }
}
