class ImprimirPedido {
  String numeropedido;

  ImprimirPedido({this.numeropedido});

  ImprimirPedido.fromJson(Map<String, dynamic> json) {
    numeropedido = json['numeropedido'];
  }

  Map<String, dynamic> toMap() => {
        'numeropedido': this.numeropedido,
      };
}
