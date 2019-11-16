class ListaComandas {
  String codigo;
  String descricao;
  String numero;
  String numpedido;
  String status;
  String txservico;
  String garcon;
  String semtaxa;
  String pedirgarcon;
  String pedircliente;
  String cliente;

  ListaComandas(
      {this.codigo,
      this.descricao,
      this.numero,
      this.numpedido,
      this.status,
      this.txservico,
      this.garcon,
      this.semtaxa,
      this.pedirgarcon,
      this.pedircliente,
      this.cliente});

  ListaComandas.fromJson(Map<String, dynamic> json) {
    codigo = json['CODIGO'];
    descricao = json['DESCRICAO'];
    numero = json['NUMERO'];
    numpedido = json['NUMPEDIDO'];
    status = json['STATUS'];
    txservico = json['TXSERVICO'];
    garcon = json['GARCON'];
    semtaxa = json['SEMTAXA'];
    pedirgarcon = json['PEDIRGARCON'];
    pedircliente = json['PEDIRCLIENTE'];
    cliente = json['CLIENTE'];
  }
}
