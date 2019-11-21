class InserirProduto {
  String codigomesa;
  String cdproduto;
  String qtde;
  String itensobs;
  String cdprofissional;
  String imprimiritemcozinha;

  InserirProduto(
      {this.codigomesa,
      this.cdproduto,
      this.qtde,
      this.itensobs,
      this.cdprofissional,
      this.imprimiritemcozinha});

  InserirProduto.fromJson(Map<String, dynamic> json) {
    codigomesa = json['codigomesa'];
    cdproduto = json['cdproduto'];
    qtde = json['qtde'];
    itensobs = json['itensobs'];
    cdprofissional = json['cdprofissional'];
    imprimiritemcozinha = json['imprimiritemcozinha'];
  }

  Map<String, dynamic> toMap() => {
    'codigomesa': this.codigomesa,
    'cdproduto': this.cdproduto,
    'qtde': this.qtde,
    'itensobs': this.itensobs,
    'cdprofissional': this.cdprofissional,
    'imprimiritemcozinha': this.imprimiritemcozinha,
  };
}
