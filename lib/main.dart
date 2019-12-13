import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_timer/custom_text_container.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyApp> {
  bool isActive = false;
  static const Duration _duration = Duration(seconds: 1);

  Timer timer;

  int _count = 0;

  void _handleState() {
    setState(() {
      if(isActive){
        _count+=1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    int _seconds = _count % 60;
    int _minutes = _count ~/ 60;
    int _hours = _count ~/ 3600;

    if(timer == null) {
      timer = Timer.periodic(_duration,(Timer t){
        _handleState();
      });
    }

    return MaterialApp(
      title: "Timer",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Timer"),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomTextContainer(
                    value: _hours.toString(),
                    label: "HOURS",
                  ),
                  CustomTextContainer(
                    value: _minutes.toString(),
                    label: "MINS",
                  ),
                  CustomTextContainer(
                    value: _seconds.toString(),
                    label: "SECS",
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: MaterialButton(
                  color: Colors.blueAccent,
                    child: Text(isActive ? "STOP" : "START",style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      setState(() {
                        isActive = !isActive;
                        print(isActive);
                      });
                    }),
              )
            ],
          ),
        )
      ),
    );
  }
}
