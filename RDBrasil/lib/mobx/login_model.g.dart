// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginModel on _LoginModelBase, Store {
  final _$emailAtom = Atom(name: '_LoginModelBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwAtom = Atom(name: '_LoginModelBase.passw');

  @override
  String get passw {
    _$passwAtom.reportRead();
    return super.passw;
  }

  @override
  set passw(String value) {
    _$passwAtom.reportWrite(value, super.passw, () {
      super.passw = value;
    });
  }

  final _$loggedAtom = Atom(name: '_LoginModelBase.logged');

  @override
  bool get logged {
    _$loggedAtom.reportRead();
    return super.logged;
  }

  @override
  set logged(bool value) {
    _$loggedAtom.reportWrite(value, super.logged, () {
      super.logged = value;
    });
  }

  final _$_LoginModelBaseActionController =
      ActionController(name: '_LoginModelBase');

  @override
  dynamic changeEmail(String newEmail) {
    final _$actionInfo = _$_LoginModelBaseActionController.startAction(
        name: '_LoginModelBase.changeEmail');
    try {
      return super.changeEmail(newEmail);
    } finally {
      _$_LoginModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePassw(String newPassw) {
    final _$actionInfo = _$_LoginModelBaseActionController.startAction(
        name: '_LoginModelBase.changePassw');
    try {
      return super.changePassw(newPassw);
    } finally {
      _$_LoginModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeLogged(bool newLogged) {
    final _$actionInfo = _$_LoginModelBaseActionController.startAction(
        name: '_LoginModelBase.changeLogged');
    try {
      return super.changeLogged(newLogged);
    } finally {
      _$_LoginModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
passw: ${passw},
logged: ${logged}
    ''';
  }
}
