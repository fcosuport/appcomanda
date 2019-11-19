import 'package:appcomanda/model/comandas.dart';
import 'package:appcomanda/request/requests.dart';
import 'package:appcomanda/ui/itenscomanda.dart';
import 'package:appcomanda/utils/arguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ComandasTela extends StatefulWidget {
  @override
  _ComandasTelaState createState() => _ComandasTelaState();
}

class _ComandasTelaState extends State<ComandasTela> {
  Future<List<ListaComandas>> _getComandas() async {
    List<ListaComandas> listaRecuperada = await Requests.getListaComandas();
    return listaRecuperada;
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
        body: _listaComandas());
  }

  Widget _listaComandas() {
    return FutureBuilder<List<ListaComandas>>(
      future: _getComandas(),
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
            List<ListaComandas> comanda = snapshot.data;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: comanda.length,
              itemBuilder: (context, index) {
                return _comandaTile(comanda[index]);
              },
            );
            break;
          default:
        }
      },
    );
  }

  Widget _comandaTile(ListaComandas comanda) {
    return ListTile(
      title: Text(
        comanda.numero,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text('${comanda.descricao} ${comanda.status}'),
      trailing: Icon(Icons.arrow_forward_ios),
      leading: CircleAvatar(
        child: Icon(comanda.status == 'OCUPADA' ? Icons.lock : Icons.lock_open, color: Colors.white),
        backgroundColor:
            comanda.status == 'OCUPADA' ? Colors.red : Colors.green,
      ),
      onTap: () {
        if (comanda.status == 'OCUPADA') {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItensComandaTela(),
                  settings: RouteSettings(
                      arguments: ItensComandaArguments(comanda.numpedido,
                          comanda.descricao, comanda.numero))));
        } else {
          Navigator.pushNamed(context, '/grupos');
        }
      },
    );
  }
}
