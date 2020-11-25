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

  final _$entregaAtom = Atom(name: '_Carrinho.entrega');

  @override
  double get entrega {
    _$entregaAtom.reportRead();
    return super.entrega;
  }

  @override
  set entrega(double value) {
    _$entregaAtom.reportWrite(value, super.entrega, () {
      super.entrega = value;
    });
  }

  final _$enderecoAtom = Atom(name: '_Carrinho.endereco');

  @override
  Endereco get endereco {
    _$enderecoAtom.reportRead();
    return super.endereco;
  }

  @override
  set endereco(Endereco value) {
    _$enderecoAtom.reportWrite(value, super.endereco, () {
      super.endereco = value;
    });
  }

  final _$cartaoAtom = Atom(name: '_Carrinho.cartao');

  @override
  Cartao get cartao {
    _$cartaoAtom.reportRead();
    return super.cartao;
  }

  @override
  set cartao(Cartao value) {
    _$cartaoAtom.reportWrite(value, super.cartao, () {
      super.cartao = value;
    });
  }

  final _$_CarrinhoActionController = ActionController(name: '_Carrinho');

  @override
  void addItem(dynamic nome, dynamic descricao, dynamic pic,
      double valorIndividual, int quantidade) {
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
entrega: ${entrega},
endereco: ${endereco},
cartao: ${cartao},
valorTotal: ${valorTotal}
    ''';
  }
}
