class ListaGarcon {
  String cdprofissional;
  String nome;

  ListaGarcon({this.cdprofissional, this.nome});

  ListaGarcon.fromJson(Map<String, dynamic> json) {
    cdprofissional = json['cdprofissional'];
    nome = json['nome'];
  }
}
