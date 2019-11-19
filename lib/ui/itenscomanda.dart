import 'package:appcomanda/utils/arguments.dart';
import 'package:flutter/material.dart';

class ItensComandaTela extends StatefulWidget {
  @override
  _ItensComandaTelaState createState() => _ItensComandaTelaState();
}

class _ItensComandaTelaState extends State<ItensComandaTela> {
  String _numpedido;
  String _numero;
  String _descricao;

  @override
  Widget build(BuildContext context) {
    final ItensComandaArguments args =
        ModalRoute.of(context).settings.arguments;

    setState(() {
      _numpedido = args.numpedido;
      _numero = args.numero;
      _descricao = args.descricao;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('$_descricao $_numero'),
        centerTitle: true,
      ),
      //body:
    );
  }
}
