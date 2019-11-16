import 'package:appcomanda/ui/produtos.dart';
import 'package:flutter/material.dart';

class GruposTela extends StatefulWidget {
  @override
  _GruposTelaState createState() => _GruposTelaState();
}

class _GruposTelaState extends State<GruposTela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grupo de Produtos'),
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          ListTile(
            title: Text('Sanduiches'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProdutosTela()));
            },
          ),
          ListTile(
              title: Text('Refrigerentes'),
              trailing: Icon(Icons.arrow_forward_ios))
        ],
      ),
    );
  }
}
