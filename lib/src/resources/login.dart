import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_list/src/bloc/loginPresenter.dart';
import 'package:flutter_app_list/src/resources/dialog/loading_dialog.dart';
import 'package:flutter_app_list/src/resources/dialog/msgDialog.dart';
import 'package:flutter_app_list/src/resources/home.dart';
import 'package:flutter_app_list/src/resources/register.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  LoginPresenter loginPresenter = new LoginPresenter();
  bool isShowPass = false;
  TextEditingController userNameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Container(
                width: 200,
                height: 200,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.amber),
                child: Image.asset('icon_taxi2.png'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Text(
                  "Welcome everyone",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Text(
                  "Login to using ...",
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: StreamBuilder(
                    stream: loginPresenter.userStream,
                    builder: (context, snapshot) {
                      return TextField(
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        controller: userNameController,
                        decoration: InputDecoration(
                            errorText:
                                snapshot.hasError ? snapshot.error : null,
                            labelText: "USERNAME",
                            labelStyle:
                                TextStyle(color: Colors.green, fontSize: 15)),
                      );
                    }),
              ),
              Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget>[
                  StreamBuilder(
                      stream: loginPresenter.passwordStream,
                      builder: (context, snapshot) {
                        return TextField(
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          controller: passwordController,
                          obscureText: !isShowPass, // style : password
                          decoration: InputDecoration(
                              errorText:
                                  snapshot.hasError ? snapshot.error : null,
                              errorStyle: TextStyle(
                                  color: Colors.red[600], fontSize: 12),
                              labelText: "PASSWORD",
                              labelStyle:
                                  TextStyle(color: Colors.green, fontSize: 15)),
                        );
                      }),
                  GestureDetector(
                    onTap: onShowPassword,
                    child: Text(
                      isShowPass ? "Show" : "Hide",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: AlignmentDirectional.centerEnd,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(fontSize: 16, color: Colors.blueGrey[400]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    color: Colors.blue,
                    onPressed: onSignInClicked,
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: RichText(
                    text: TextSpan(
                        text: "New user?",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        children: <TextSpan>[
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: gotoRegister));
                            },
                          text: "Sign up for a new account",
                          style: TextStyle(fontSize: 14, color: Colors.blue))
                    ])),
              )
            ],
          ),
        ),
      ),
    ));
  }

  void onSignInClicked() {
    setState(() {
      if (loginPresenter.isValidInformation(
          userNameController.text, passwordController.text)) {
        LoadingDialog.showLoadingDialog(context, 'Loading...');
        loginPresenter.signIn(userNameController.text, passwordController.text,
            () {
          LoadingDialog.hideLoadingDialog(context);
          Navigator.push(context, MaterialPageRoute(builder: gotoHome));
        }, (msg) {
          LoadingDialog.hideLoadingDialog(context);
          MsgDialog.showMsgDialog(context, "Sign in", msg);
        });
      }
    });
  }

  Widget gotoRegister(BuildContext context) {
    return RegisterPage();
  }

  Widget gotoHome(BuildContext context) {
    return HomePage();
  }

  void onShowPassword() {
    setState(() {
      isShowPass = !isShowPass;
    });
  }

  @override
  void dispose() {
    super.dispose();
    loginPresenter.dispose();
  }
}
