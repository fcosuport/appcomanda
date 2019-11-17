import 'package:http/http.dart' as http;

class Requests {
  static Future getListaComandas() async {
    var url = 'http://192.168.1.100:8171/eventos/listacomandas';
    return await http.get(url);
  }

  static Future getListaGrupos() async {
    var url = 'http://192.168.1.100:8171/eventos/listagrupos';
    return await http.get(url);
  }

  static Future getListaProdutos() async {
    var url = 'http://192.168.1.100:8171/eventos/listaprodutos';
    return await http.get(url);
  }
}
