class ListaProdutos {
  String controle;
  String barra;
  String referencia;
  String descricao;
  String unid;
  String prvenda;

  ListaProdutos(
      {this.controle,
      this.barra,
      this.referencia,
      this.descricao,
      this.unid,
      this.prvenda});

  ListaProdutos.fromJson(Map<String, dynamic> json) {
    controle = json['controle'];
    barra = json['barra'];
    referencia = json['referencia'];
    descricao = json['descricao'];
    unid = json['unid'];
    prvenda = json['prvenda'];
  }

  Map<String, dynamic> toMap() => {
    'controle': controle,
    'barra': barra,
    'refrencia': referencia,
    'descricao': descricao,
    'unid': unid,
    'prvenda': prvenda
  };
}
