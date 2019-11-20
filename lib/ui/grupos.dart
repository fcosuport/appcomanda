import 'package:appcomanda/model/grupos.dart';
import 'package:appcomanda/request/requests.dart';
import 'package:appcomanda/ui/produtos.dart';
import 'package:appcomanda/utils/arguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GruposTela extends StatefulWidget {
  @override
  _GruposTelaState createState() => _GruposTelaState();
}

class _GruposTelaState extends State<GruposTela> {
  String _numeroComanda;

  Future<List<ListaGrupos>> _getGrupos() async {
    List<ListaGrupos> grupos = await Requests.getListaGrupos();
    return grupos;
  }

  @override
  Widget build(BuildContext context) {
    final GruposArguments args = ModalRoute.of(context).settings.arguments;

    setState(() {
      _numeroComanda = args.numeroComanda;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Grupo de Produtos'),
        centerTitle: true,
      ),
      body: _listaGrupos(),
    );
  }

  Widget _listaGrupos() {
    return FutureBuilder<List<ListaGrupos>>(
      future: _getGrupos(),
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
            List<ListaGrupos> grupos = snapshot.data;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: grupos.length,
              itemBuilder: (context, index) {
                return _grupoTile(grupos[index]);
              },
            );
            break;
        }
      },
    );
  }

  Widget _grupoTile(ListaGrupos grupo) {
    return ListTile(
      title: Text(
        grupo.descricao,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios),
      leading: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Icon(Icons.fastfood, color: Colors.white),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProdutosTela(),
                settings: RouteSettings(
                    arguments:
                        ProdutosArguments(grupo.cdgrupo, grupo.descricao))));
      },
    );
  }
}
