import 'package:flutter/material.dart';
import 'package:productivityApp/screens/Auth/AuthPageWrapper.dart';
import 'package:productivityApp/screens/ScreensWrapper.dart';

class AuthWrapper extends StatelessWidget {
  final _authKey = "";
  bool isAuthenticate = false;
  @override
  Widget build(BuildContext context) {
    return isAuthenticate ? ScreensWrapper() : AuthPageWrapper();
  }
}
