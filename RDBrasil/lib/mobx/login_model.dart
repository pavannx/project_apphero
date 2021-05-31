import 'package:mobx/mobx.dart';
part 'login_model.g.dart';

class LoginModel = _LoginModelBase with _$LoginModel;

abstract class _LoginModelBase with Store {
  @observable
  String email;

  @observable
  String passw;

  @observable
  bool logged = true;

  @action
  changeEmail(String newEmail) {
    email = newEmail;
  }

  @action
  changePassw(String newPassw) {
    passw = newPassw;
  }

  @action
  changeLogged(bool newLogged) {
    logged = newLogged;
  }
}
