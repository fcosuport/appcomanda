class GruposArguments {
  final String codigocomanda;

  GruposArguments(this.codigocomanda);
}

class ProdutosArguments {
  final String cdgrupo;
  final String descricao;
  final String codigocomanda;

  ProdutosArguments(this.cdgrupo, this.descricao, this.codigocomanda);
}

class ItensComandaArguments {
  final String numpedido;
  final String descricao;
  final String numero;
  final String codigocomanda;

  ItensComandaArguments(
      this.numpedido, this.descricao, this.numero, this.codigocomanda);
}

class InserirItemArguments {
  final String controle;
  final String descricao;
  final String codigocomanda;

  InserirItemArguments(this.controle, this.descricao, this.codigocomanda);
}

class GarconsArguments {
  final String codigocomanda;

  GarconsArguments(this.codigocomanda);
}
