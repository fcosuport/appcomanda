class Pedido {
  String cdpedido;
  String totalprod;
  String totalped;
  String acrescimo;
  String cdprofissional;
  String mesacomanda;
  String vendedor;
  String obs;

  Pedido(
      {this.cdpedido,
      this.totalprod,
      this.totalped,
      this.acrescimo,
      this.cdprofissional,
      this.mesacomanda,
      this.vendedor,
      this.obs});

  Pedido.fromJson(Map<String, dynamic> json) {
    cdpedido = json['cdpedido'];
    totalprod = json['totalprod'];
    totalped = json['totalped'];
    acrescimo = json['acrescimo'];
    cdprofissional = json['cdprofissional'];
    mesacomanda = json['mesacomanda'];
    vendedor = json['vendedor'];
    obs = json['obs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cdpedido'] = this.cdpedido;
    data['totalprod'] = this.totalprod;
    data['totalped'] = this.totalped;
    data['acrescimo'] = this.acrescimo;
    data['cdprofissional'] = this.cdprofissional;
    data['mesacomanda'] = this.mesacomanda;
    data['vendedor'] = this.vendedor;
    data['obs'] = this.obs;
    return data;
  }
}
