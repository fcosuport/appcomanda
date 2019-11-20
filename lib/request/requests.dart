import 'package:appcomanda/model/comandas.dart';
import 'package:appcomanda/model/grupos.dart';
import 'package:appcomanda/model/itenscomanda.dart';
import 'package:appcomanda/model/produtos.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../model/garcon.dart';

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

  static Future<List<ItensComanda>> getItensComanda(String pedido) async {
    final storage = new FlutterSecureStorage();
    List<ItensComanda> itensComanda = [];
    var json = [];
    Dio dio = new Dio();
    try {
      Response response = await dio.get(
          '${await storage.read(key: 'URLAPI')}/eventos/itenscomanda?cdpedido=$pedido');
      json = response.data;
    } catch (e) {
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

  static Future<List<ListaGrupos>> getListaGrupos() async {
    final storage = new FlutterSecureStorage();
    List<ListaGrupos> listaGrupo = [];
    var json = [];
    Dio dio = new Dio();
    try {
      Response response = await dio
          .get('${await storage.read(key: 'URLAPI')}/eventos/listagrupos');
      json = response.data;
    } catch (e) {
      print(e);
    }
    if (json != []) {
      json.forEach(((grupos) {
        ListaGrupos grupo = ListaGrupos.fromJson(grupos);
        listaGrupo.add(grupo);
      }));
    }
    return listaGrupo;
  }

  static Future<List<ListaProdutos>> getListaProdutos(String cdgrupo) async {
    final storage = new FlutterSecureStorage();
    List<ListaProdutos> listaProduto = [];
    var json = [];
    Dio dio = new Dio();
    try {
      Response response = await dio.get(
          '${await storage.read(key: 'URLAPI')}/eventos/listaprodutos?cdgrupo=$cdgrupo');
      json = response.data;
    } catch (e) {
      print(e);
    }
    if (json != []) {
      json.forEach(((produtos) {
        ListaProdutos produto = ListaProdutos.fromJson(produtos);
        listaProduto.add(produto);
      }));
    }
    return listaProduto;
  }

  static Future getPedido(String pedido) async {
    final storage = new FlutterSecureStorage();
    var url =
        '${await storage.read(key: 'URLAPI')}/eventos/pedido?cdpedido=$pedido';
    return await http.get(url);
  }

  static Future getListaGarcon() async {
    final storage = new FlutterSecureStorage();
    List<ListaGarcon> listaGarcon = [];
    var json = [];
    Dio dio = new Dio();
    try {
      Response response = await dio.get('${await storage.read(key: 'URLAPI')}/eventos/listagarcon');
      json = response.data;
    } catch(e) {
      print(e);
    }
    json.forEach((garcons) {
      ListaGarcon garcon = ListaGarcon.fromJson(garcons);
      listaGarcon.add(garcon);
    });
    return listaGarcon;
  }
}
