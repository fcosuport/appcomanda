import 'package:appcomanda/ui/configuracoes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'comandas.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashScreenSegundos = 4;

  Future<String> _verificaURLAPI() async {
    final storage = new FlutterSecureStorage();
    return await storage.read(key: 'URLAPI');
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: splashScreenSegundos)).then((_) {
      _verificaURLAPI().then((value) {
        if (value != null && value != '') {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => ComandasTela()));
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => Configuracoes()));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset('assets/splash/splash1.png', fit: BoxFit.fill)),
      ),
    );
  }
}
