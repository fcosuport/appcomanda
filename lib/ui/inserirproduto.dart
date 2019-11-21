import 'package:appcomanda/model/inserirproduto.dart';
import 'package:appcomanda/request/requests.dart';
import 'package:flutter/material.dart';
import 'package:xlive_switch/xlive_switch.dart';
import '../utils/arguments.dart';

class InserirProdutoTela extends StatefulWidget {
  @override
  _InserirProdutoTelaState createState() => _InserirProdutoTelaState();
}

class _InserirProdutoTelaState extends State<InserirProdutoTela> {
  String _controle;
  String _descricao;
  String _codigocomanda;
  String _cdgarcon;

  @override
  Widget build(BuildContext context) {
    bool _imprimir = false;

    final InserirItemArguments args = ModalRoute.of(context).settings.arguments;

    TextEditingController _controllerQtde = new TextEditingController();
    TextEditingController _controllerObs = new TextEditingController();

    setState(() {
      _controle = args.controle;
      _descricao = args.descricao;
      _codigocomanda = args.codigocomanda;
      _cdgarcon = args.cdgarcon;
    });

    void _changeValue(bool value) {
      setState(() {
        _imprimir = value;
      });
    }

    Widget _quantidade() {
      return Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
                color: Colors.blue,
                icon: Icon(Icons.remove),
                onPressed: () {
                  if ((double.parse(_controllerQtde.text) - 1) > 0) {
                    _controllerQtde.text =
                        (double.parse(_controllerQtde.text) - 1).toString();
                  }
                }),
            Container(
              width: 100.0,
              child: TextField(
                textAlign: TextAlign.center,
                controller: _controllerQtde,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                cursorColor: Colors.grey[300],
                maxLines: 1,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
            ),
            IconButton(
                color: Colors.blue,
                icon: Icon(Icons.add),
                onPressed: () {
                  if (_controllerQtde.text == '') {
                    _controllerQtde.text = '1.0';
                  } else {
                    _controllerQtde.text =
                        (double.parse(_controllerQtde.text) + 1).toString();
                  }
                })
          ],
        ),
      );
    }

    Widget _imprimirPedido() {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        child: Column(
          children: <Widget>[
            Text('Deseja imprimir na Cozinha?',
                style: TextStyle(fontWeight: FontWeight.bold)),
            XlivSwitch(
              value: _imprimir,
              onChanged: _changeValue,
            ),
          ],
        ),
      );
    }

    Widget _descricaoProduto() {
      return Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Text(
          _descricao,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          textAlign: TextAlign.center,
        ),
      );
    }

    Widget _observacao() {
      return Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: TextField(
          controller: _controllerObs,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          maxLines: 1,
          decoration: InputDecoration(
              hintText: 'Observação', border: OutlineInputBorder()),
        ),
      );
    }

    void _postItemPedido() async {
      InserirProduto produto = new InserirProduto(
          qtde: _controllerQtde.text,
          imprimiritemcozinha: _imprimir ? 'T' : 'F',
          cdprofissional: _cdgarcon,
          codigomesa: _codigocomanda,
          cdproduto: _controle,
          itensobs: _controllerObs.text);
      Future<InserirProduto> pedido = await Requests.postItenPedido(produto);
      pedido.then((value) {
        print(value);
      });
    }

    Widget _confirmar() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
        child: Container(
          height: 50.0,
          child: RaisedButton(
            onPressed: () => _postItemPedido(),
            child: Text(
              'Confirmar',
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
            color: Colors.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
          ),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Adicionando Produto'),
          centerTitle: true,
        ),
        body: Container(
          height: 380.0,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: Card(
              elevation: 5.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _descricaoProduto(),
                  _quantidade(),
                  _imprimirPedido(),
                  _observacao(),
                  _confirmar()
                ],
              ),
            ),
          ),
        ));
  }
}
