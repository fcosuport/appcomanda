class ItensComanda {
  String cdpedido;
  String ordem;
  String controle;
  String descricao;
  String unid;
  String qtde;
  String unitario;
  String vldesconto;
  String totalitem;
  String itensobs;

  ItensComanda(
      {this.cdpedido,
      this.ordem,
      this.controle,
      this.descricao,
      this.unid,
      this.qtde,
      this.unitario,
      this.vldesconto,
      this.totalitem,
      this.itensobs});

  ItensComanda.fromJson(Map<String, dynamic> json) {
    cdpedido = json['cdpedido'];
    ordem = json['ordem'];
    controle = json['controle'];
    descricao = json['descricao'];
    unid = json['unid'];
    qtde = json['qtde'];
    unitario = json['unitario'];
    vldesconto = json['vldesconto'];
    totalitem = json['totalitem'];
    itensobs = json['itensobs'];
  }
}
