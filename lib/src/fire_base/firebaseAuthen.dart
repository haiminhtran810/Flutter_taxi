import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FireAuth {
  FirebaseAuth _fireBaseAuth = FirebaseAuth.instance;

  void signUp(String email, String pass, String name, String phone,
      Function onSuccess, Function(String) onRegisterError) {
    _fireBaseAuth
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((user) {
      createUser(user.uid, name, phone, onSuccess, onRegisterError);
      print(user);
    }).catchError((err) {
      onSignUpErr(err.code, onRegisterError);
    });
  }

  createUser(String userId, String name, String phone, Function onSuccess,
      Function(String) onRegisterError) {
    var user = {"name": name, "phone": phone};
    var ref = FirebaseDatabase.instance.reference().child("users");
    ref.child(userId).set(user).then((user) {
      onSuccess();
    }).catchError((err) {
      onSignUpErr(err.code, onRegisterError);
    });
  }

  void signIn(String email, String pass, Function onSuccess,
      Function(String) onSignInError) {
    _fireBaseAuth
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((user) {
      onSuccess();
    }).catchError((err) {
      onSignInError("Error");
    });
  }

  void onSignUpErr(String code, Function(String) onRegisterError) {
    switch (code) {
      case "ERROR_WEAK_PASSWORD":
      case "ERROR_INVALID_EMAIL":
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "ERROR_INVALID_CREDENTIAL":
      case "ERROR_USER_NOT_FOUND":
      case "ERROR_USER_NOT_FOUND":
      case "ERROR_USER_NOT_FOUND":
        onRegisterError("Error");
        break;
      default:
        onRegisterError("Error");
        break;
    }
  }

  void onSignInErr(Function(String) onRegisterError) {
    onRegisterError("Login Error");
  }
}
