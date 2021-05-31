import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:superhero_app/mobx/login_model.dart';
import 'package:superhero_app/mobx/validate_fields.dart';
import 'package:superhero_app/screens/home.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final LoginModel loginModel = LoginModel();

  bool validated = true;

  @computed
  bool get isValid {
    return validateEmail() == null &&
        loginModel.email != null &&
        validatePassword() == null &&
        loginModel.passw != null;
  }

  // validate email
  String validateEmail() {
    return ValidateFields.emailValidation(loginModel.email);
  }

  // validate password
  String validatePassword() {
    return ValidateFields.passwordValidation(loginModel.passw);
  }

  // button validations
  onPressed(BuildContext context) async {
    // here goes the Service and Routes
    var router = new MaterialPageRoute(builder: (BuildContext context) {
      return Home();
    });

    Navigator.of(context).push(router);
  }
}
