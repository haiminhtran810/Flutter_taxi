import 'dart:async';

import 'package:flutter_app_list/src/fire_base/firebaseAuthen.dart';
import 'package:flutter_app_list/src/validations/validator.dart';

class LoginPresenter {
  FireAuth _fireAuth = new FireAuth();

  // ignore: close_sinks
  StreamController userController = new StreamController();

  // ignore: close_sinks
  StreamController passwordController = new StreamController();

  // have 2 ways to write The Get method in Dart

  // * Option 1 :
  Stream get userStream => userController.stream;

  Stream get passwordStream => passwordController.stream;

  // Option 2:

  /*Stream getUserStream() {
    return userController.stream;
  }

  Stream getPasswordStream() {
    return passwordController.stream;
  }*/

  bool isValidInformation(String username, String password) {
    Validator checkValid = new Validator();
    if (!checkValid.isValidUser(username)) {
      userController.sink.addError("Username Error");
      return false;
    }

    if (!checkValid.isValidPassword(password)) {
      passwordController.sink.addError("Password Error");
      return false;
    }

    passwordController.sink.addError("Password Ok");
    userController.sink.addError("Username Ok");
    return true;
  }

  void signIn(String username, String password, Function onSuccess,
      Function(String) onSignInError) {
    _fireAuth.signIn(username, password, onSuccess, onSignInError);
  }

  void dispose() {
    userController.close();
    passwordController.close();
  }
}
