import 'dart:async';
import 'package:audiorecorder/authentication.dart';
import 'package:flutter/material.dart';
import 'package:audiorecorder/authentication.dart';

class SplashPage extends StatefulWidget {
  @override
  State createState() => new _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    // Listen for our auth event (on reload or start)
    // Go to our /todos page once logged in
    firebaseAuth.onAuthStateChanged
        .firstWhere((user) => user != null)
        .then((user) {
      Navigator.of(context).pushReplacementNamed('/home');
    });

    // Give the navigation animations, etc, some time to finish
    new Future.delayed(new Duration(seconds: 2))
        .then((_) => signInWithGoogle());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new CircularProgressIndicator(),
              new SizedBox(width: 20.0),
              new Text("Please wait..."),
            ],
          ),
        ],
      ),
    );
  }
}
