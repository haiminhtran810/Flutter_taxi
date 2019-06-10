import 'package:flutter/material.dart';

class RiderPicker extends StatefulWidget {
  @override
  _RiderPickerState createState() => _RiderPickerState();
}

class _RiderPickerState extends State<RiderPicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: Colors.blueGrey, offset: Offset(0, 5), blurRadius: 5.0)
          ]),
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 50,
            child: FlatButton(
                onPressed: () {},
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: <Widget>[
                      SizedBox(
                        width: 40,
                        height: 50,
                        child: Center(
                          child: Image.asset('icon_taxi2.png'),
                        ),
                      ),
                      Positioned(
                          right: 0,
                          top: 0,
                          width: 40,
                          height: 50,
                          child: Center(
                            child: Image.asset('icon_taxi2.png'),
                          )),
                      Padding(
                        padding: EdgeInsets.only(left: 40, right: 50),
                        child: Text(
                          "467 điện biên phủ, Phường bình thạnh",
                          overflow: TextOverflow.ellipsis,
                          style:
                              TextStyle(fontSize: 16, color: Colors.blueGrey),
                        ),
                      )
                    ],
                  ),
                )),
          ),
          Container(
            width: double.infinity,
            height: 50,
            child: FlatButton(
                onPressed: () {},
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: <Widget>[
                      SizedBox(
                        width: 40,
                        height: 50,
                        child: Center(
                          child: Image.asset('icon_taxi2.png'),
                        ),
                      ),
                      Positioned(
                          right: 0,
                          top: 0,
                          width: 40,
                          height: 50,
                          child: Center(
                            child: Image.asset('icon_destination.png'),
                          )),
                      Padding(
                        padding: EdgeInsets.only(left: 40, right: 50),
                        child: Text(
                          "Home",
                          overflow: TextOverflow.ellipsis,
                          style:
                              TextStyle(fontSize: 16, color: Colors.blueGrey),
                        ),
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
