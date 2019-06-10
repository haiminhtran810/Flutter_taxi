import 'dart:async';

import 'package:flutter_app_list/src/fire_base/firebaseAuthen.dart';
import 'package:flutter_app_list/src/validations/validator.dart';

class RegisterPresenter {
  Validator _validations = new Validator();
  FireAuth _fireAuth = new FireAuth();

  StreamController _userNameController = new StreamController();
  StreamController _passwordController = new StreamController();
  StreamController _emailController = new StreamController();
  StreamController _phoneController = new StreamController();

  Stream get userStream => _userNameController.stream;

  Stream get passwordStream => _passwordController.stream;

  Stream get emailStream => _emailController.stream;

  Stream get phoneStream => _phoneController.stream;

  bool isValid(String name, String email, String pass, String phone) {
    if (name == null || name.length == 0) {
      _userNameController.sink.addError("Wrong Name");
      return false;
    }

    _userNameController.sink.add("");

    if (email == null ||
        email.length == 0 ||
        !_validations.isValidUser(email)) {
      _emailController.sink.addError("Wrong Email");
      return false;
    }

    _emailController.sink.add("");

    if (pass == null || pass.length == 0) {
      _passwordController.sink.addError("Wrong password");
      return false;
    }

    _userNameController.sink.add("");

    if (phone == null || phone.length == 0) {
      _phoneController.sink.addError("Wrong Phone");
      return false;
    }

    _userNameController.sink.add("");

    return true;
  }

  void signUp(String name, String email, String pass, String phone,
      Function onSuccess,Function(String) onRegisterError) {
    _fireAuth.signUp(email, pass, name, phone, onSuccess,onRegisterError);
  }

  void dispose() {
    _emailController.close();
    _userNameController.close();
    _phoneController.close();
    _passwordController.close();
  }
}
