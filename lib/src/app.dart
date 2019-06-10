import 'package:flutter/material.dart';
import 'package:flutter_app_list/src/resources/login.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false, home: LoginPage());
  }
}
