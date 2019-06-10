import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_list/src/bloc/registerPresenter.dart';
import 'package:flutter_app_list/src/resources/dialog/loading_dialog.dart';
import 'package:flutter_app_list/src/resources/dialog/msgDialog.dart';
import 'package:flutter_app_list/src/resources/home.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  RegisterPresenter _registerPresenter = new RegisterPresenter();
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: 200,
                height: 200,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                child: Image.asset('icon_taxi.png'),
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
                  "Signup with ... in simple app",
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: StreamBuilder(
                      stream: _registerPresenter.userStream,
                      builder: (context, snapshot) {
                        return TextField(
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          controller: _userNameController,
                          decoration: InputDecoration(
                              errorText:
                                  snapshot.hasError ? snapshot.error : null,
                              prefixIcon: Container(
                                width: 50,
                                child: Image.asset('icon_people.png'),
                              ),
                              labelText: "Name",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueGrey[200], width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6))),
                              labelStyle:
                                  TextStyle(color: Colors.green, fontSize: 15)),
                        );
                      })),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: StreamBuilder(
                      stream: _registerPresenter.phoneStream,
                      builder: (context, snapshot) {
                        return TextField(
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          controller: _phoneController,
                          decoration: InputDecoration(
                              errorText:
                                  snapshot.hasError ? snapshot.error : null,
                              prefixIcon: Container(
                                width: 50,
                                child: Image.asset('icon_phone.png'),
                              ),
                              labelText: "Phone Number",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueGrey[200], width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6))),
                              labelStyle:
                                  TextStyle(color: Colors.green, fontSize: 15)),
                        );
                      })),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: StreamBuilder(
                      stream: _registerPresenter.emailStream,
                      builder: (context, snapshot) {
                        return TextField(
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          controller: _emailController,
                          decoration: InputDecoration(
                              errorText:
                                  snapshot.hasError ? snapshot.error : null,
                              prefixIcon: Container(
                                width: 50,
                                child: Image.asset('icon_email.png'),
                              ),
                              labelText: "Email",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueGrey[200], width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6))),
                              labelStyle:
                                  TextStyle(color: Colors.green, fontSize: 15)),
                        );
                      })),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: StreamBuilder(
                      stream: _registerPresenter.passwordStream,
                      builder: (context, snapshot) {
                        return TextField(
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          controller: _passwordController,
                          decoration: InputDecoration(
                              errorText:
                                  snapshot.hasError ? snapshot.error : null,
                              prefixIcon: Container(
                                width: 50,
                                child: Image.asset('icon_lock.png'),
                              ),
                              labelText: "Password",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueGrey[200], width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6))),
                              labelStyle:
                                  TextStyle(color: Colors.green, fontSize: 15)),
                        );
                      })),
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
                      "Sign up",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 30),
                child: RichText(
                    text: TextSpan(
                        text: "Already a User?",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        children: <TextSpan>[
                      TextSpan(
                          text: "Login now",
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
      if (_registerPresenter.isValid(
          _userNameController.text,
          _emailController.text,
          _passwordController.text,
          _phoneController.text)) {
        LoadingDialog.showLoadingDialog(context, 'Loading...');
        _registerPresenter.signUp(
            _userNameController.text,
            _emailController.text,
            _passwordController.text,
            _phoneController.text, () {
          LoadingDialog.hideLoadingDialog(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        }, (msg) {
          LoadingDialog.hideLoadingDialog(context);
          MsgDialog.showMsgDialog(context, "Sign up", msg);
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _registerPresenter.dispose();
  }
}
