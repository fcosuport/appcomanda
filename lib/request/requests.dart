//mport 'package:appcomanda/model/comandas.dart';
import 'package:http/http.dart' as http;

class Requests {
  static Future getListaComandas() async {
    var url = 'http://192.168.1.100:8171/eventos/listacomandas';
    return await http.get(url);
  }
}
