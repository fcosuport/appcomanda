import 'package:appcomanda/ui/grupos.dart';
import 'package:appcomanda/utils/arguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../model/garcon.dart';
import '../request/requests.dart';

class GarconTela extends StatefulWidget {
  @override
  _GarconTelaState createState() => _GarconTelaState();
}

class _GarconTelaState extends State<GarconTela> {
  String _codigocomanda;

  Future<List<ListaGarcon>> _getGarcons() async {
    List<ListaGarcon> garcons = await Requests.getListaGarcon();
    return garcons;
  }

  @override
  Widget build(BuildContext context) {
    final GarconsArguments args = ModalRoute.of(context).settings.arguments;
    _codigocomanda = args.codigocomanda;

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Garçons'),
        centerTitle: true,
      ),
      body: _listaGarcons(),
    );
  }

  Widget _listaGarcons() {
    return FutureBuilder<List<ListaGarcon>>(
      future: _getGarcons(),
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
            List<ListaGarcon> garcons = snapshot.data;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: garcons.length,
              itemBuilder: (context, index) {
                return _garconTile(garcons[index]);
              },
            );
            break;
        }
      },
    );
  }

  Widget _garconTile(ListaGarcon garcon) {
    return ListTile(
      title: Text(
        garcon.nome,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios),
      leading: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Icon(Icons.person, color: Colors.white),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => GruposTela(),
                settings: RouteSettings(
                    arguments: GruposArguments(
                        _codigocomanda, garcon.cdprofissional))));
      },
    );
  }
}
