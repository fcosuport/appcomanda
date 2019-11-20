class GruposArguments {
  final String codigomesa;

  GruposArguments(this.codigomesa);
}

class ProdutosArguments {
  final String cdgrupo;
  final String descricao;
  final String codigomesa;

  ProdutosArguments(this.cdgrupo, this.descricao, this.codigomesa);
}

class ItensComandaArguments {
  final String numpedido;
  final String descricao;
  final String numero;
  final String codigomesa;

  ItensComandaArguments(
      this.numpedido, this.descricao, this.numero, this.codigomesa);
}

class InserirItemArguments {
  final String controle;
  final String descricao;
  final String codigomesa;

  InserirItemArguments(this.controle, this.descricao, this.codigomesa);
}
