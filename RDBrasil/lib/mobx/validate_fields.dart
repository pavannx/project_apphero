/// classe usada para controle de validações do app

class ValidateFields {
  static String emailValidation(String email) {
    ///Regex email validation.
    const String _pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    ///checking if email is valid

    if (email == null) {
      return null;
    } else if (email == '') {
      return "E-mail não pode ser vazio";
    } else if (!RegExp(_pattern).hasMatch(email)) {
      return "E-mail inválido";
    } else if (email != 'rd@gmail.com') {
      return "E-mail incorreto";
    }
    return null;
  }

  // validação da senha no momento de login
  static String passwordValidation(String passw) {
    if (passw == null) {
      return null;
    } else if (passw == '') {
      return 'Senha não pode ser vazia';
    } else if (passw.length < 6) {
      return 'A senha deve ter mais de 6 dígitos';
    } else if (passw != 'rd1234') {
      return 'Senha incorreta';
    }
    return null;
  }
}
