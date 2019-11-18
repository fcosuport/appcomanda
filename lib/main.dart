import 'package:appcomanda/ui/comandas.dart';
import 'package:appcomanda/ui/configuracoes.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    String _url;

    Future<String> _verificaURLAPI() async {
      final storage = new FlutterSecureStorage();
      return await storage.read(key: 'URLAPI');
    }

    _verificaURLAPI().then((value) {
      _url = value;
    });

    return MaterialApp(
      title: 'App Comanda Eletrônica',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _url != null ? ComandasTela() : Configuracoes(),
    );
  }
}
