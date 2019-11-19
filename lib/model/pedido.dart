class Pedido {
  String cdpedido;
  String totalprod;
  String totalped;
  String acrescimo;
  String cdprofissional;
  String obs;
  String vendedor;

  Pedido(
      {this.cdpedido,
      this.totalprod,
      this.totalped,
      this.acrescimo,
      this.cdprofissional,
      this.obs,
      this.vendedor});

  Pedido.fromJson(Map<String, dynamic> json) {
    cdpedido = json['cdpedido'];
    totalprod = json['totalprod'];
    totalped = json['totalped'];
    acrescimo = json['acrescimo'];
    cdprofissional = json['cdprofissional'];
    obs = json['obs'];
    vendedor = json['vendedor'];
  }
}
