import 'package:flutter/material.dart';
import 'package:productivityApp/screens/authWapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthWrapper(
        logOut: false,
      ),
    );
  }
}
