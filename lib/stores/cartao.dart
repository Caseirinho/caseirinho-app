import 'package:mobx/mobx.dart';

part 'cartao.g.dart';

class Cartao = _Cartao with _$Cartao;

abstract class _Cartao with Store {
  _Cartao();

  @observable
  String numero = '';

  @observable
  String nome = '';

  @observable
  String validade = '';

  @observable
  String cvv = '';

  @computed
  String get numeroMascarado =>
      (numero.split(" ")..replaceRange(1, 3, ["xxxx", "xxxx"])).join(" ");
}
