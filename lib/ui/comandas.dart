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
        body: _listagem());
  }

  Widget _listagem() {
    return FutureBuilder<List<ListaComandas>>(
      future: _getComandas(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
            return Container();
          case ConnectionState.none:
            return Container();
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
                return ListTile(
                  title: Text(
                    comanda[index].numero,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                      '${comanda[index].descricao} ${comanda[index].status}'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  leading: CircleAvatar(
                    backgroundColor: comanda[index].status == 'OCUPADA'
                        ? Colors.red
                        : Colors.green,
                  ),
                  onTap: () {
                    if (comanda[index].status == 'OCUPADA') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ItensComandaTela(),
                              settings: RouteSettings(
                                  arguments: ItensComandaArguments(
                                      comanda[index].numpedido,
                                      comanda[index].descricao,
                                      comanda[index].numero))));
                    } else {
                      Navigator.pushNamed(context, '/grupos');
                    }
                  },
                );
              },
            );
            break;
          default:
        }
      },
    );
  }
}
