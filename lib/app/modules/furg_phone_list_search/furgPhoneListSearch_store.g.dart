// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'furgPhoneListSearch_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FurgPhoneListSearchStore on _FurgPhoneListSearchStoreBase, Store {
  final _$valueAtom = Atom(name: '_FurgPhoneListSearchStoreBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_FurgPhoneListSearchStoreBaseActionController =
      ActionController(name: '_FurgPhoneListSearchStoreBase');

  @override
  void increment() {
    final _$actionInfo = _$_FurgPhoneListSearchStoreBaseActionController
        .startAction(name: '_FurgPhoneListSearchStoreBase.increment');
    try {
      return super.increment();
    } finally {
      _$_FurgPhoneListSearchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
