class Cardapio {

  int id;
  String name;
  String descricao;
  String preco;

  Cardapio(this.name, this.descricao, this.preco);

  @override
  String toString() {
    return "Cardapio(id: $id, name: $name,descricao: $descricao,preco: $preco)";
  }

}