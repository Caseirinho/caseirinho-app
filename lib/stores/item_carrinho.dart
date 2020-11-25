import 'package:mobx/mobx.dart';

part 'item_carrinho.g.dart';

class ItemCarrinho = _ItemCarrinho with _$ItemCarrinho;

abstract class _ItemCarrinho with Store {
  _ItemCarrinho(this.nome, this.descricao, this.pic, this.valorIndividual,
      this.quantidade);

  @observable
  String nome = '';

  @observable
  String descricao = '';

  @observable
  String pic = '';

  @observable
  double valorIndividual = 0;

  @observable
  int quantidade = 0;

  @computed
  double get valor => this.quantidade * this.valorIndividual;
}
