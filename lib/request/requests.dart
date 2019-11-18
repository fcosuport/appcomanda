import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class Requests {
  //http://192.168.1.100:8171

  static Future getListaComandas() async {
    final storage = new FlutterSecureStorage();
    var url = '${await storage.read(key: 'URLAPI')}/eventos/listacomandas';
    return await http.get(url);
  }

  static Future getListaGrupos() async {
    final storage = new FlutterSecureStorage();
    var url = '${await storage.read(key: 'URLAPI')}/eventos/listagrupos';
    return await http.get(url);
  }

  static Future getListaProdutos() async {
    final storage = new FlutterSecureStorage();
    var url = '${await storage.read(key: 'URLAPI')}/eventos/listaprodutos';
    return await http.get(url);
  }
}
