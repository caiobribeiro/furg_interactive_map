// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'furgPhoneListSearch_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FurgPhoneListSearchStore on _FurgPhoneListSearchStoreBase, Store {
  final _$searchPhoneListStringAtom =
      Atom(name: '_FurgPhoneListSearchStoreBase.searchPhoneListString');

  @override
  String get searchPhoneListString {
    _$searchPhoneListStringAtom.reportRead();
    return super.searchPhoneListString;
  }

  @override
  set searchPhoneListString(String value) {
    _$searchPhoneListStringAtom.reportWrite(value, super.searchPhoneListString,
        () {
      super.searchPhoneListString = value;
    });
  }

  final _$responseAtom = Atom(name: '_FurgPhoneListSearchStoreBase.response');

  @override
  Response<dynamic>? get response {
    _$responseAtom.reportRead();
    return super.response;
  }

  @override
  set response(Response<dynamic>? value) {
    _$responseAtom.reportWrite(value, super.response, () {
      super.response = value;
    });
  }

  final _$responseStringAtom =
      Atom(name: '_FurgPhoneListSearchStoreBase.responseString');

  @override
  String get responseString {
    _$responseStringAtom.reportRead();
    return super.responseString;
  }

  @override
  set responseString(String value) {
    _$responseStringAtom.reportWrite(value, super.responseString, () {
      super.responseString = value;
    });
  }

  final _$getPhoneSearchAsyncAction =
      AsyncAction('_FurgPhoneListSearchStoreBase.getPhoneSearch');

  @override
  Future<PhoneListApi> getPhoneSearch() {
    return _$getPhoneSearchAsyncAction.run(() => super.getPhoneSearch());
  }

  final _$_FurgPhoneListSearchStoreBaseActionController =
      ActionController(name: '_FurgPhoneListSearchStoreBase');

  @override
  void setSearchTelListString(String value) {
    final _$actionInfo =
        _$_FurgPhoneListSearchStoreBaseActionController.startAction(
            name: '_FurgPhoneListSearchStoreBase.setSearchTelListString');
    try {
      return super.setSearchTelListString(value);
    } finally {
      _$_FurgPhoneListSearchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchPhoneListString: ${searchPhoneListString},
response: ${response},
responseString: ${responseString}
    ''';
  }
}
