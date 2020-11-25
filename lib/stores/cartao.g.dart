// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cartao.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Cartao on _Cartao, Store {
  Computed<String> _$numeroMascaradoComputed;

  @override
  String get numeroMascarado => (_$numeroMascaradoComputed ??= Computed<String>(
          () => super.numeroMascarado,
          name: '_Cartao.numeroMascarado'))
      .value;

  final _$numeroAtom = Atom(name: '_Cartao.numero');

  @override
  String get numero {
    _$numeroAtom.reportRead();
    return super.numero;
  }

  @override
  set numero(String value) {
    _$numeroAtom.reportWrite(value, super.numero, () {
      super.numero = value;
    });
  }

  final _$nomeAtom = Atom(name: '_Cartao.nome');

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

  final _$validadeAtom = Atom(name: '_Cartao.validade');

  @override
  String get validade {
    _$validadeAtom.reportRead();
    return super.validade;
  }

  @override
  set validade(String value) {
    _$validadeAtom.reportWrite(value, super.validade, () {
      super.validade = value;
    });
  }

  final _$cvvAtom = Atom(name: '_Cartao.cvv');

  @override
  String get cvv {
    _$cvvAtom.reportRead();
    return super.cvv;
  }

  @override
  set cvv(String value) {
    _$cvvAtom.reportWrite(value, super.cvv, () {
      super.cvv = value;
    });
  }

  @override
  String toString() {
    return '''
numero: ${numero},
nome: ${nome},
validade: ${validade},
cvv: ${cvv},
numeroMascarado: ${numeroMascarado}
    ''';
  }
}
