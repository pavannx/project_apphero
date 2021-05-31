import 'package:flutter/material.dart';
import 'package:superhero_app/mobx/login_controller.dart';
import 'package:superhero_app/shared_widget/text_fields.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

LoginController _loginCtrl = LoginController();
TextEditingController controllerEmail = TextEditingController();
TextEditingController controllerPassword = TextEditingController();

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(
            FocusNode(),
          );
        },
        child: Center(
          child: Observer(builder: (_) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormModel(
                    color: Colors.white,
                    onChanged: _loginCtrl.loginModel.changeEmail,
                    labelText: 'E-mail *',
                    controller: controllerEmail,
                    icon: Icons.person,
                    textInput: TextInputType.emailAddress,
                    obscureText: false,
                    errorText: _loginCtrl.validateEmail(),
                  ),
                  TextFormModel(
                    labelText: 'Senha *',
                    controller: controllerPassword,
                    icon: Icons.lock_outline,
                    textInput: TextInputType.text,
                    obscureText: true,
                    validator: (passw) {},
                    color: Colors.white,
                    onChanged: _loginCtrl.loginModel.changePassw,
                    errorText: _loginCtrl.validatePassword(),
                  ),
                  Observer(builder: (_) {
                    return Container(
                      padding: EdgeInsets.all(20),
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.white),
                        child: Text('entrar'.toUpperCase(),
                            style: TextStyle(color: Colors.black)),
                        onPressed: _loginCtrl.isValid
                            ? () async {
                                _loginCtrl.onPressed(context);
                              }
                            : null,
                      ),
                    );
                  }),
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 20),
                    child: Text(
                      'Copyright © RD RaiaDrogasil 2021.',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
