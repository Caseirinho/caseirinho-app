import 'package:mobx/mobx.dart';

part 'endereco.g.dart';

class Endereco = _Endereco with _$Endereco;

abstract class _Endereco with Store {
  _Endereco();

  @observable
  String nome = '';

  @observable
  String logradouro = '';

  @observable
  String numero = '';

  @observable
  String complemento = '';

  @observable
  String bairro = '';

  @observable
  String cidade = '';

  @observable
  String uf = '';
}
