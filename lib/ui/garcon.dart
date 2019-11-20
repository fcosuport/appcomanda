import 'package:flutter/material.dart';

import '../model/garcon.dart';
import '../request/requests.dart';

class GarconTela extends StatefulWidget {
  @override
  _GarconTelaState createState() => _GarconTelaState();
}

class _GarconTelaState extends State<GarconTela> {
  Future<List<ListaGarcon>> _getGarcons() async {
    List<ListaGarcon> garcons = await Requests.getListaGarcon();
    return garcons;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}