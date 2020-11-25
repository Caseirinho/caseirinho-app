// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_carrinho.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItemCarrinho on _ItemCarrinho, Store {
  Computed<double> _$valorComputed;

  @override
  double get valor => (_$valorComputed ??=
          Computed<double>(() => super.valor, name: '_ItemCarrinho.valor'))
      .value;

  final _$nomeAtom = Atom(name: '_ItemCarrinho.nome');

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  final _$descricaoAtom = Atom(name: '_ItemCarrinho.descricao');

  @override
  String get descricao {
    _$descricaoAtom.reportRead();
    return super.descricao;
  }

  @override
  set descricao(String value) {
    _$descricaoAtom.reportWrite(value, super.descricao, () {
      super.descricao = value;
    });
  }

  final _$picAtom = Atom(name: '_ItemCarrinho.pic');

  @override
  String get pic {
    _$picAtom.reportRead();
    return super.pic;
  }

  @override
  set pic(String value) {
    _$picAtom.reportWrite(value, super.pic, () {
      super.pic = value;
    });
  }

  final _$valorIndividualAtom = Atom(name: '_ItemCarrinho.valorIndividual');

  @override
  double get valorIndividual {
    _$valorIndividualAtom.reportRead();
    return super.valorIndividual;
  }

  @override
  set valorIndividual(double value) {
    _$valorIndividualAtom.reportWrite(value, super.valorIndividual, () {
      super.valorIndividual = value;
    });
  }

  final _$quantidadeAtom = Atom(name: '_ItemCarrinho.quantidade');

  @override
  int get quantidade {
    _$quantidadeAtom.reportRead();
    return super.quantidade;
  }

  @override
  set quantidade(int value) {
    _$quantidadeAtom.reportWrite(value, super.quantidade, () {
      super.quantidade = value;
    });
  }

  @override
  String toString() {
    return '''
nome: ${nome},
descricao: ${descricao},
pic: ${pic},
valorIndividual: ${valorIndividual},
quantidade: ${quantidade},
valor: ${valor}
    ''';
  }
}
