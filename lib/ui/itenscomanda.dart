import 'package:appcomanda/model/itenscomanda.dart';
import 'package:appcomanda/request/requests.dart';
import 'package:appcomanda/ui/grupos.dart';
import 'package:appcomanda/utils/arguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ItensComandaTela extends StatefulWidget {
  @override
  _ItensComandaTelaState createState() => _ItensComandaTelaState();
}

class _ItensComandaTelaState extends State<ItensComandaTela> {
  String _numpedido;
  String _numero;
  String _descricao;
  String _codigomesa;

  Future<List<ItensComanda>> _getItensComanda() async {
    List<ItensComanda> itens = await Requests.getItensComanda(_numpedido);
    return itens;
  }

  @override
  Widget build(BuildContext context) {
    final ItensComandaArguments args =
        ModalRoute.of(context).settings.arguments;

    setState(() {
      _numpedido = args.numpedido;
      _numero = args.numero;
      _descricao = args.descricao;
      _codigomesa = args.codigomesa;
    });

    return Scaffold(
        bottomSheet: Container(
          height: 50.0,
          width: MediaQuery.of(context).size.width,
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 10.0),
            child: Text('Total: R\$ 0,00',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        appBar: AppBar(
          title: Text('$_descricao $_numero'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.print, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GruposTela(),
                      settings: RouteSettings(
                          arguments: GruposArguments(_codigomesa))));
            },
            child: Icon(Icons.add, color: Colors.white),
            backgroundColor: Colors.amber),
        body: _itensComanda());
  }

  Widget _itensComanda() {
    return FutureBuilder<List<ItensComanda>>(
      future: _getItensComanda(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Container(
              child: Center(
                child: SpinKitWave(color: Colors.blue),
              ),
            );
          case ConnectionState.done:
            List<ItensComanda> itensComanda = snapshot.data;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: itensComanda.length,
              itemBuilder: (context, index) {
                return _itensTile(itensComanda[index]);
              },
            );
            break;
        }
      },
    );
  }

  Widget _itensTile(ItensComanda itens) {
    return ListTile(
      onTap: () {},
      title:
          Text(itens.descricao, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('Qtde: ${itens.qtde}'),
          Text(itens.unid),
          Text(
              'R\$ ${double.parse(itens.unitario.replaceAll(',', '.')).toStringAsFixed(2).replaceAll('.', ',')}'),
          Text(
              'R\$ ${double.parse(itens.totalitem.replaceAll(',', '.')).toStringAsFixed(2).replaceAll('.', ',')}')
        ],
      ),
    );
  }
}
