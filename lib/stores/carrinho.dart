import 'package:caseirinho_app/stores/item_carrinho.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'carrinho.g.dart';

// This is the class used by rest of your codebase
class Carrinho = _Carrinho with _$Carrinho;

// The store-class
abstract class _Carrinho with Store {
  @observable
  ObservableList<ItemCarrinho> itens = ObservableList<ItemCarrinho>();

  @observable
  double entrega = 2.0;

  @action
  void addItem(nome, descricao, pic, double valorIndividual, int quantidade) {
    itens.add(ItemCarrinho(nome, descricao, pic, valorIndividual, quantidade));
  }

  @computed
  double get valorTotal => itens.fold(
      0.0, (previousValue, element) => previousValue + element.valor) + entrega;
}
