import 'package:appcomanda/model/comandas.dart';
import 'package:appcomanda/model/itenscomanda.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class Requests {

  static Future<List<ListaComandas>> getListaComandas() async {
    final storage = new FlutterSecureStorage();
    List<ListaComandas> comandas = [];
    var json = [];
    Dio dio = new Dio();
    try {
      Response response = await dio
          .get('${await storage.read(key: 'URLAPI')}/eventos/listacomandas');
      json = response.data;
    } catch (e) {
      print(e);
    }
    if (json != []) {
      json.forEach((comanda) {
        ListaComandas lista = ListaComandas.fromMap(comanda);
        comandas.add(lista);
      });
    }
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
    List<ItensComanda> itensComanda = [];
    var json = [];
    Dio dio = new Dio();
    try {
      Response response = await dio.get('${await storage.read(key: 'URLAPI')}/eventos/itenscomanda?cdpedido=$pedido');
      json = response.data;
    } catch(e) {
      print(e);
    }
    if (json != []) {
      json.forEach((item) {
        ItensComanda itens = ItensComanda.fromMap(item);
        itensComanda.add(itens);
      });
    }
    return itensComanda;
  }

  static Future getPedido(String pedido) async {
    final storage = new FlutterSecureStorage();
    var url =
        '${await storage.read(key: 'URLAPI')}/eventos/pedido?cdpedido=$pedido';
    return await http.get(url);
  }

  static Future getListaGarcon() async {
    final storage = new FlutterSecureStorage();
    var url = '${await storage.read(key: 'URLAPI')}/eventos/listagarcon';
    return await http.get(url);
  }
}
