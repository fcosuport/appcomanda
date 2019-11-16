import 'package:appcomanda/ui/inserirproduto.dart';
import 'package:flutter/material.dart';

class ProdutosTela extends StatefulWidget {
  @override
  _ProdutosTelaState createState() => _ProdutosTelaState();
}

class _ProdutosTelaState extends State<ProdutosTela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos do Grupo: Fulano'),
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          ListTile(
            title: Text('X-Salada'),
            subtitle: Text('12,00'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => InserirProdutoTela()));
            },
          ),
          ListTile(
              title: Text('Coca Cola'),
              subtitle: Text('3,50'),
              trailing: Icon(Icons.arrow_forward_ios))
        ],
      ),
    );
  }
}
