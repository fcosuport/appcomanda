import 'package:appcomanda/model/produtos.dart';
import 'package:appcomanda/request/requests.dart';
import 'package:appcomanda/ui/inserirproduto.dart';
import 'package:appcomanda/utils/arguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProdutosTela extends StatefulWidget {
  @override
  _ProdutosTelaState createState() => _ProdutosTelaState();
}

class _ProdutosTelaState extends State<ProdutosTela> {
  String _cdgrupo;
  String _descricaogrupo;
  String _codigocomanda;
  String _cdgarcon;
  String _numerocomanda;
  String _descricaocomanda;

  Future<List<ListaProdutos>> _getProdutos() async {
    List<ListaProdutos> produtos = await Requests.getListaProdutos(_cdgrupo);
    return produtos;
  }

  @override
  Widget build(BuildContext context) {
    final ProdutosArguments args = ModalRoute.of(context).settings.arguments;
    _cdgrupo = args.cdgrupo;
    _descricaogrupo = args.descricaogrupo;
    _codigocomanda = args.codigocomanda;
    _cdgarcon = args.cdgarcon;
    _numerocomanda = args.numerocomanda;
    _descricaocomanda = args.descricaocomanda;

    return Scaffold(
      appBar: AppBar(
        title: Text(_descricaogrupo),
        centerTitle: true,
      ),
      body: _listaProdutos(),
    );
  }

  Widget _listaProdutos() {
    return FutureBuilder<List<ListaProdutos>>(
      future: _getProdutos(),
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
            List<ListaProdutos> produtos = snapshot.data;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: produtos.length,
              itemBuilder: (context, index) {
                return _produtoTile(produtos[index]);
              },
            );
            break;
        }
      },
    );
  }

  Widget _produtoTile(ListaProdutos produto) {
    return ListTile(
      title: Text(
        produto.descricao,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        'R\$ ${double.parse(produto.prvenda.replaceAll(',', '.')).toStringAsFixed(2).replaceAll('.', ',')}',
        style: TextStyle(
          fontSize: 18,
          color: Colors.green,
          //fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios),
      //leading: Icon(Icons.fastfood, color: Colors.blue),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => InserirProdutoTela(),
                settings: RouteSettings(
                    arguments: InserirItemArguments(
                        produto.controle,
                        produto.descricao,
                        _codigocomanda,
                        _cdgarcon,
                        _numerocomanda,
                        _descricaocomanda))));
      },
    );
  }
}
