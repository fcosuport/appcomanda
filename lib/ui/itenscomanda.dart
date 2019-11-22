import 'package:appcomanda/model/itenscomanda.dart';
import 'package:appcomanda/model/pedido.dart';
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
  int _numpedido;
  double _totalPedido = 0.00;
  String _descricao = 'Carregando ...';
  String _codigoMesa;
  String _cdgarcon;

  //VAMOS SUBSTITUIR OS ARGUMENTOS PELOS CAMPOS QUE VAO VIM NO GETPEDIDO
  //_numpedido vai vim da resposta do post (numero do pedido) quando inserir o produto chamar essa tela aqui
  // quando essa tela aqui for chamada do comandas (quando tiver ocupada) esse (numero do pedido) vai vim de comandas
  //com isso vamos ter somente 1 argumento no itenscomanda que é _numpedido

  //_numero e descricao vao vim do getpedido em um campo so 'OBS'
  //_codigomesa tambem vai vim do getpedido campo 'MESACOMANDA'
  //_cdgarcon tambem vai vim do getpedido campo 'CDPROFISSIONAL'

  Future<List<ItensComanda>> _getItensComanda() async {
    List<ItensComanda> itens = await Requests.getItensComanda(_numpedido);
    return itens;
  }

  Future<Pedido> _getPedido() async {
    Pedido pedido = await Requests.getPedido(_numpedido);
    return pedido;
  }

  _getDadosComanda() async {
    Pedido pedido = await _getPedido();
    setState(() {
      _descricao = pedido.obs;
      _codigoMesa = pedido.mesacomanda;
      _cdgarcon = pedido.cdprofissional;
      _totalPedido = double.parse(pedido.totalped.replaceAll(',', '.'));
    });
  }

  @override
  Widget build(BuildContext context) {
    final ItensComandaArguments args =
        ModalRoute.of(context).settings.arguments;
    _numpedido = args.numpedido;
    //TODO: RESOLVER BUG DE FICARNO LOOP DE CARREGANDO
    _getDadosComanda();

    return Scaffold(
        bottomSheet: Container(
          height: 50.0,
          width: MediaQuery.of(context).size.width,
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 10.0),
            child: Text(
                'Total: R\$ ${_totalPedido.toStringAsFixed(2).replaceAll('.', ',')}',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        appBar: AppBar(
          title: Text(_descricao),
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
                          arguments: GruposArguments(_codigoMesa, _cdgarcon))));
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
