import 'package:appcomanda/ui/comandas.dart';
import 'package:appcomanda/ui/configuracoes.dart';
import 'package:appcomanda/ui/garcon.dart';
import 'package:appcomanda/ui/grupos.dart';
import 'package:appcomanda/ui/inserirproduto.dart';
import 'package:appcomanda/ui/itenscomanda.dart';
import 'package:appcomanda/ui/produtos.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Future<String> _verificaURLAPI() async {
      final storage = new FlutterSecureStorage();
      return await storage.read(key: 'URLAPI');
    }

    return MaterialApp(
      title: 'App Comanda Eletrônica',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        '/comandas': (context) => ComandasTela(),
        '/configuracoes': (context) => Configuracoes(),
        '/grupos': (context) => GruposTela(),
        '/produtos': (context) => ProdutosTela(),
        '/inserirProduto': (context) => InserirProdutoTela(),
        '/itensComanda': (context) => ItensComandaTela(),
        '/garcons': (context) => GarconTela()
      },
      home: FutureBuilder(
        future: _verificaURLAPI(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Scaffold(
                body: Container(
                  child: Center(
                    child: SpinKitWave(color: Colors.blue),
                  ),
                ),
              );
            case ConnectionState.done:
              print(snapshot.data);
              if (snapshot.data != null && snapshot.data != '') {
                return ComandasTela();
              } else {
                return Configuracoes();
              }
              break;
          }
        },
      ),
    );
  }
}
