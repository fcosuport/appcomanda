import 'package:appcomanda/model/comandas.dart';
import 'package:appcomanda/model/grupos.dart';
import 'package:appcomanda/model/imprimirpedido.dart';
import 'package:appcomanda/model/inserirproduto.dart';
import 'package:appcomanda/model/itenscomanda.dart';
import 'package:appcomanda/model/produtos.dart';
import 'package:appcomanda/model/pedido.dart';
import '../model/garcon.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      Fluttertoast.showToast(
          msg: e,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    if (json != []) {
      json.forEach((comanda) {
        ListaComandas lista = ListaComandas.fromMap(comanda);
        comandas.add(lista);
      });
    }
    return comandas;
  }

  static Future<List<ItensComanda>> getItensComanda(int pedido) async {
    final storage = new FlutterSecureStorage();
    List<ItensComanda> itensComanda = [];
    var json = [];
    Dio dio = new Dio();
    try {
      Response response = await dio.get(
          '${await storage.read(key: 'URLAPI')}/eventos/itenscomanda?cdpedido=$pedido');
      json = response.data;
    } catch (e) {
      Fluttertoast.showToast(
          msg: e,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
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
      Fluttertoast.showToast(
          msg: e,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
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
      Fluttertoast.showToast(
          msg: e,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    if (json != []) {
      json.forEach(((produtos) {
        ListaProdutos produto = ListaProdutos.fromJson(produtos);
        listaProduto.add(produto);
      }));
    }
    return listaProduto;
  }

  static Future<Pedido> getPedido(int cdpedido) async {
    final storage = new FlutterSecureStorage();
    Pedido listaPedido;
    var json = [];
    Dio dio = new Dio();
    try {
      Response response = await dio.get(
          '${await storage.read(key: 'URLAPI')}/eventos/pedido?cdpedido=$cdpedido');
      json = response.data;
      print(json);
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    if (json != []) {
      Pedido pedido = Pedido.fromJson(json[0]);
      listaPedido = pedido;
    }
    return listaPedido;
  }

  static Future<List<ListaGarcon>> getListaGarcon() async {
    final storage = new FlutterSecureStorage();
    List<ListaGarcon> listaGarcon = [];
    var json = [];
    Dio dio = new Dio();
    try {
      Response response = await dio
          .get('${await storage.read(key: 'URLAPI')}/eventos/listagarcon');
      json = response.data;
    } catch (e) {
      Fluttertoast.showToast(
          msg: e,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    json.forEach((garcons) {
      ListaGarcon garcon = ListaGarcon.fromJson(garcons);
      listaGarcon.add(garcon);
    });
    return listaGarcon;
  }

  static Future<int> postItenPedido(InserirProduto inserirProduto) async {
    final storage = new FlutterSecureStorage();

    Dio dio = new Dio();
    try {
      Response response = await dio.post(
          '${await storage.read(key: 'URLAPI')}/eventos/inserirproduto',
          data: inserirProduto.toMap());
      return response.data;
    } catch (e) {
      Fluttertoast.showToast(
          msg: e,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  static Future<int> postImprimirPedido(ImprimirPedido imprimirPedido) async {
    final storage = new FlutterSecureStorage();

    Dio dio = new Dio();
    try {
      Response response = await dio.post(
          '${await storage.read(key: 'URLAPI')}/eventos/imprimirpedido',
          data: imprimirPedido.toMap());
      return response.data;
    } catch (e) {
      Fluttertoast.showToast(
          msg: e,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
