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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codigomesa'] = this.codigomesa;
    data['cdproduto'] = this.cdproduto;
    data['qtde'] = this.qtde;
    data['itensobs'] = this.itensobs;
    data['cdprofissional'] = this.cdprofissional;
    data['imprimiritemcozinha'] = this.imprimiritemcozinha;
    return data;
  }
}
