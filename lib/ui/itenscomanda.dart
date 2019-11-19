import 'package:appcomanda/utils/arguments.dart';
import 'package:flutter/material.dart';

class ItensComandaTela extends StatefulWidget {
  @override
  _ItensComandaTelaState createState() => _ItensComandaTelaState();
}

class _ItensComandaTelaState extends State<ItensComandaTela> {
  String _pedido;

  @override
  Widget build(BuildContext context) {
    final ItensComandaArguments args =
        ModalRoute.of(context).settings.arguments;

    setState(() {
      _pedido = args.pedido;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Itens da Comanda 002'),
        centerTitle: true,
      ),
      //body:
    );
  }
}
