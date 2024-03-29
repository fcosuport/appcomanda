import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Configuracoes extends StatefulWidget {
  @override
  _ConfiguracoesState createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes> {
  TextEditingController _controller = TextEditingController();

  void _buscaConfiguracoes() async {
    final storage = new FlutterSecureStorage();
    _controller.text = await storage.read(key: 'URLAPI');
  }

  @override
  void initState() {
    _buscaConfiguracoes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _salvarURLAPI() async {
      if (_controller.text.length == 0) {
        Fluttertoast.showToast(
            msg: 'Insira o endereço da API',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 4,
            backgroundColor: Colors.amber,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        final storage = new FlutterSecureStorage();
        await storage.write(key: 'URLAPI', value: _controller.text);
        Navigator.popAndPushNamed(context, '/comandas');
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _controller,
              keyboardType: TextInputType.url,
              textInputAction: TextInputAction.done,
              maxLines: 1,
              decoration: InputDecoration(
                  hintText: 'URL da API',
                  helperText: 'Ex: http://167.114.135.196:8171',
                  border: OutlineInputBorder()),
            ),
            SizedBox(height: 15.0),
            Container(
              height: 50.0,
              child: RaisedButton(
                onPressed: () => _salvarURLAPI(),
                child: Text(
                  'Salvar',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
