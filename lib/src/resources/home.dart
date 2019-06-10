import 'package:flutter/material.dart';
import 'package:flutter_app_list/src/resources/widgets/home_menu.dart';
import 'package:flutter_app_list/src/resources/widgets/ride_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePageState();
  }
}

class HomePageState extends StatefulWidget {
  @override
  _HomePageStateState createState() => _HomePageStateState();
}

class _HomePageStateState extends State<HomePageState> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        body: Container(
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(11.571694, 107.838986), zoom: 15.00),
              ),
              Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  child: Column(
                    children: <Widget>[
                      AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        title: Text(
                          "Seminar demo",
                          style: TextStyle(color: Colors.black),
                        ),
                        leading: FlatButton(
                            onPressed: () {
                              _scaffoldKey.currentState.openDrawer();
                            },
                            child: Image.asset('icon_taxi2.png')),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: RiderPicker(),
                      )
                    ],
                  ))
            ],
          ),
        ),
        drawer: Drawer(
          child: HomeMenu(),
        ),
      ),
    );
  }
}

void moveCamera() {}

void checkDrawPolyline() {}
