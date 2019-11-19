import 'package:appcomanda/model/comandas.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class Requests {
  //http://192.168.1.100:8171

  static Future<List<ListaComandas>> getListaComandas() async {
    final storage = new FlutterSecureStorage();
    List<ListaComandas> comandas = [];
    var json = [];
    Dio dio = new Dio();
    Response response = await dio
        .get('${await storage.read(key: 'URLAPI')}/eventos/listacomandas');
    json = response.data;
    json.forEach((comanda) {
      print(comanda);
      ListaComandas lista = ListaComandas.fromMap(comanda);
      comandas.add(lista);
    });
    return comandas;
  }

  static Future getListaGrupos() async {
    final storage = new FlutterSecureStorage();
    var url = '${await storage.read(key: 'URLAPI')}/eventos/listagrupos';
    return await http.get(url);
  }

  static Future getListaProdutos(String grupo) async {
    final storage = new FlutterSecureStorage();
    var url =
        '${await storage.read(key: 'URLAPI')}/eventos/listaprodutos?cdgrupo=$grupo';
    print(url);
    return await http.get(url);
  }

  static Future getItensComanda(String pedido) async {
    final storage = new FlutterSecureStorage();
    var url =
        '${await storage.read(key: 'URLAPI')}/eventos/itenscomanda?cdpedido=$pedido';
    print(url);
    return await http.get(url);
  }

  static Future getPedido(String pedido) async {
    final storage = new FlutterSecureStorage();
    var url =
        '${await storage.read(key: 'URLAPI')}/eventos/pedido?cdpedido=$pedido';
    return await http.get(url);
  }
}
