import 'package:flutter/material.dart';

class HomeMenu extends StatefulWidget {
  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Image.asset('ic_menu.png'),
          title: Text(
            "Menu 1",
            style: TextStyle(fontSize: 18, color: Colors.blue),
          ),
        ),
        ListTile(
          leading: Image.asset('ic_menu.png'),
          title: Text(
            "Menu 2",
            style: TextStyle(fontSize: 18, color: Colors.blue),
          ),
        ),
        ListTile(
          leading: Image.asset('ic_menu.png'),
          title: Text(
            "Menu 3",
            style: TextStyle(fontSize: 18, color: Colors.blue),
          ),
        ),
        ListTile(
          leading: Image.asset('ic_menu.png'),
          title: Text(
            "Menu 4",
            style: TextStyle(fontSize: 18, color: Colors.blue),
          ),
        ),
        ListTile(
          leading: Image.asset('ic_menu.png'),
          title: Text(
            "Menu 5",
            style: TextStyle(fontSize: 18, color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
