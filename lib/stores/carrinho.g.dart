// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carrinho.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Carrinho on _Carrinho, Store {
  Computed<double> _$valorTotalComputed;

  @override
  double get valorTotal =>
      (_$valorTotalComputed ??= Computed<double>(() => super.valorTotal,
              name: '_Carrinho.valorTotal'))
          .value;

  final _$itensAtom = Atom(name: '_Carrinho.itens');

  @override
  ObservableList<ItemCarrinho> get itens {
    _$itensAtom.reportRead();
    return super.itens;
  }

  @override
  set itens(ObservableList<ItemCarrinho> value) {
    _$itensAtom.reportWrite(value, super.itens, () {
      super.itens = value;
    });
  }

  final _$_CarrinhoActionController = ActionController(name: '_Carrinho');

  @override
  void addItem(dynamic nome, dynamic descricao, dynamic pic,
      dynamic valorIndividual, dynamic quantidade) {
    final _$actionInfo =
        _$_CarrinhoActionController.startAction(name: '_Carrinho.addItem');
    try {
      return super.addItem(nome, descricao, pic, valorIndividual, quantidade);
    } finally {
      _$_CarrinhoActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
itens: ${itens},
valorTotal: ${valorTotal}
    ''';
  }
}
