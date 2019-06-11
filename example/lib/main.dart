import 'package:flutter/material.dart';
import 'package:notification_plugin/notification_plugin.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text("init"),
                onPressed: (){
                  NotificationPlugin.init(19,20);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
