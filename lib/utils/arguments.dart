class GruposArguments {
  final String codigocomanda;
  final String cdgarcon;
  final String numerocomanda;
  final String descricaocommanda;

  GruposArguments(this.codigocomanda, this.cdgarcon, this.numerocomanda,
      this.descricaocommanda);
}

class ProdutosArguments {
  final String cdgrupo;
  final String descricaogrupo;
  final String codigocomanda;
  final String cdgarcon;
  final String numerocomanda;
  final String descricaocomanda;

  ProdutosArguments(this.cdgrupo, this.descricaogrupo, this.codigocomanda,
      this.cdgarcon, this.numerocomanda, this.descricaocomanda);
}

class ItensComandaArguments {
  final int numpedido;
  final String numerocomanda;
  final String descricaocomanda;
  final String garcon;
  final String codigocomanda;

  ItensComandaArguments(this.numpedido, this.numerocomanda,
      this.descricaocomanda, this.garcon, this.codigocomanda);
}

class InserirItemArguments {
  final String codigoproduto;
  final String descricaoproduto;
  final String codigocomanda;
  final String cdgarcon;
  final String numerocomanda;
  final String descricaocomanda;

  InserirItemArguments(
      this.codigoproduto,
      this.descricaoproduto,
      this.codigocomanda,
      this.cdgarcon,
      this.numerocomanda,
      this.descricaocomanda);
}

class GarconsArguments {
  final String codigocomanda;
  final String numerocomanda;
  final String descricaocomanda;

  GarconsArguments(
      this.codigocomanda, this.numerocomanda, this.descricaocomanda);
}
