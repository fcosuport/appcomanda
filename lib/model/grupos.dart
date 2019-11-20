class ListaGrupos {
  String cdgrupo;
  String descricao;

  ListaGrupos({this.cdgrupo, this.descricao});

  ListaGrupos.fromJson(Map<String, dynamic> json) {
    cdgrupo = json['CDGRUPO'];
    descricao = json['DESCRICAO'];
  }

  Map<String, dynamic> toMap() => {'CDGRUPO': cdgrupo, 'DESCRICAO': descricao};
}
