import 'package:appcomanda/model/itenscomanda.dart';
import 'package:appcomanda/model/pedido.dart';
import 'package:appcomanda/model/imprimirpedido.dart';
import 'package:appcomanda/request/requests.dart';
import 'package:appcomanda/ui/grupos.dart';
import 'package:appcomanda/utils/arguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:progress_dialog/progress_dialog.dart';

class ItensComandaTela extends StatefulWidget {
  @override
  _ItensComandaTelaState createState() => _ItensComandaTelaState();
}

class _ItensComandaTelaState extends State<ItensComandaTela> {
  int _numpedido;
  String _numerocomanda;
  String _descricaocomanda;
  String _cdgarcon;
  String _codigocomanda;

  Future<List<ItensComanda>> _getItensComanda() async {
    List<ItensComanda> itens = await Requests.getItensComanda(_numpedido);
    return itens;
  }

  Future<Pedido> _getPedido() async {
    Pedido pedido = await Requests.getPedido(_numpedido);
    return pedido;
  }

  @override
  Widget build(BuildContext context) {
    final ItensComandaArguments args =
        ModalRoute.of(context).settings.arguments;
    _numpedido = args.numpedido;
    _numerocomanda = args.numerocomanda;
    _descricaocomanda = args.descricaocomanda;
    _cdgarcon = args.garcon;
    _codigocomanda = args.codigocomanda;

    final dialog = new ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false, showLogs: false);
    dialog.style(
        message: 'Enviando Pedido',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.w600));

    void _postImprimirPedido() async {
      dialog.show();
      ImprimirPedido pedido = new ImprimirPedido(numeropedido: '$_numpedido');
      print(pedido.toMap());
      await Requests.postImprimirPedido(pedido);
      if (dialog.isShowing()) {
        dialog.dismiss();
      }
    }

    return Scaffold(
        bottomSheet: Container(
          height: 50.0,
          width: MediaQuery.of(context).size.width,
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 10.0),
            child: FutureBuilder<Pedido>(
              future: _getPedido(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.active:
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Text('Total: R\$ 0,00',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold));
                  case ConnectionState.done:
                    return Text(
                        'Total: R\$ ${double.parse(snapshot.data.totalped.replaceAll(',', '.')).toStringAsFixed(2).replaceAll('.', ',').toString()}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold));
                    break;
                }
              },
            ),
          ),
        ),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              //Navigator.popUntil(context, ModalRoute.withName('/comandas'));
              //Navigator.of(context).popUntil(ModalRoute.withName('/comandas'));
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
          title: Text('$_descricaocomanda $_numerocomanda'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.print, color: Colors.white),
              onPressed: () => _postImprimirPedido(),
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
                          arguments: GruposArguments(_codigocomanda, _cdgarcon,
                              _numerocomanda, _descricaocomanda))));
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
            return Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: itensComanda.length,
                itemBuilder: (context, index) {
                  return _itensTile(itensComanda[index]);
                },
              ),
            );
            break;
        }
      },
    );
  }

  Widget _itensTile(ItensComanda itens) {
    return ListTile(
      onTap: () {},
      title: Text(itens.descricao,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Qtde: ${itens.qtde}',
            style: TextStyle(fontSize: 18),
          ),
          Text(itens.unid),
          Text(
            'R\$ ${double.parse(itens.unitario.replaceAll(',', '.')).toStringAsFixed(2).replaceAll('.', ',')}',
            style: TextStyle(fontSize: 18),
          ),
          Text(
            'R\$ ${double.parse(itens.totalitem.replaceAll(',', '.')).toStringAsFixed(2).replaceAll('.', ',')}',
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
