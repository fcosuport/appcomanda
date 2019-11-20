class GruposArguments {
  final String codigocomanda;
  final String cdgarcon;

  GruposArguments(this.codigocomanda, this.cdgarcon);
}

class ProdutosArguments {
  final String cdgrupo;
  final String descricao;
  final String codigocomanda;
  final String cdgarcon;

  ProdutosArguments(
      this.cdgrupo, this.descricao, this.codigocomanda, this.cdgarcon);
}

class ItensComandaArguments {
  final String numpedido;
  final String descricao;
  final String numero;
  final String codigocomanda;
  final String cdgarcon;

  ItensComandaArguments(this.numpedido, this.descricao, this.numero,
      this.codigocomanda, this.cdgarcon);
}

class InserirItemArguments {
  final String controle;
  final String descricao;
  final String codigocomanda;
  final String cdgarcon;

  InserirItemArguments(
      this.controle, this.descricao, this.codigocomanda, this.cdgarcon);
}

class GarconsArguments {
  final String codigocomanda;

  GarconsArguments(this.codigocomanda);
}
