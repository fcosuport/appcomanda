class ProdutosArguments {
  final String cdgrupo;
  final String descricao;

  ProdutosArguments(this.cdgrupo, this.descricao);
}

class ItensComandaArguments {
  final String numpedido;
  final String descricao;
  final String numero;

  ItensComandaArguments(this.numpedido, this.descricao, this.numero);
}

class InserirItemArguments {
  final String controle;
  final String descricao;

  InserirItemArguments(this.controle, this.descricao);
}

class GarconsArguments {
  final String numeroComanda;

  GarconsArguments(this.numeroComanda);
}

class GruposArguments {
  final String numeroComanda;

  GruposArguments(this.numeroComanda);
}