import 'package:flutter/material.dart';
import 'package:productivityApp/screens/Auth/Login.dart';
import 'package:productivityApp/screens/Auth/Register.dart';

class AuthPageWrapper extends StatefulWidget {
  @override
  _AuthPageWrapperState createState() => _AuthPageWrapperState();
}

class _AuthPageWrapperState extends State<AuthPageWrapper> {
  bool showLogin = true;

  void toggleView() {
    setState(() => showLogin = !showLogin);
  }

  @override
  Widget build(BuildContext context) {
    return showLogin
        ? Login(toggleView: toggleView)
        : Register(toggleView: toggleView);
  }
}
