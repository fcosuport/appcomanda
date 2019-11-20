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

    TextEditingController _controller = new TextEditingController();

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
                  if ((double.parse(_controller.text) - 1) > 0) {
                    _controller.text =
                        (double.parse(_controller.text) - 1).toString();
                  }
                }),
            Container(
              width: 100.0,
              child: TextField(
                textAlign: TextAlign.center,
                controller: _controller,
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
                  if (_controller.text == '') {
                    _controller.text = '1.0';
                  } else {
                    _controller.text =
                        (double.parse(_controller.text) + 1).toString();
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

    Widget _confirmar() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Container(
          height: 50.0,
          child: RaisedButton(
            onPressed: () {},
            child: Text(
              'Confirmar',
              style: TextStyle(color: Colors.white, fontSize: 16.0),
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
          height: 300.0,
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
                  _confirmar()
                ],
              ),
            ),
          ),
        ));
  }
}
